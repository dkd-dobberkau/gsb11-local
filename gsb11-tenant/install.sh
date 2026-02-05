#!/usr/bin/env bash

export LC_ALL=C
export LANG=C

if [ -z "${BASH_VERSION:-}" ]; then
    printf "Error: This script has only been tested and released for Bash (Shell).\n\nTo install the GSB11 in a '%s' environment, please carry out the installation steps yourself.\n" "${SHELL##*/}" >&2
    exit 1
fi

if (set -o pipefail) 2> /dev/null; then
    set -eo pipefail
else
    set -e
fi

IFS=$'\n\t'

SCRIPT_NAME="$(basename "$0")"
readonly SCRIPT_NAME

readonly DEFAULT_PROJECT_DIR="./gsb11-tenant"
readonly DEFAULT_PROJECT_NAME="gsb11-tenant"
readonly DEFAULT_PHP_VERSION="8.3"
readonly DEFAULT_DOCROOT=".build/public"
readonly DEFAULT_PROJECT_TYPE="typo3"
readonly DEFAULT_DDEV_TLD="ddev.site"
readonly MIN_DDEV_VERSION="1.24.2"
readonly DEFAULT_ADMIN_USER_PASSWORD='§Chang3Me§'

readonly COLOR_GRAY=$'\e[90m'
readonly COLOR_TASK=$'\e[37m'
readonly COLOR_GREEN=$'\e[32m'
readonly COLOR_YELLOW=$'\e[33m'
readonly COLOR_BLUE=$'\e[34m'
readonly COLOR_RED=$'\e[31m'
readonly RESET=$'\e[0m'

project_dir="${PROJECT_DIR:-$DEFAULT_PROJECT_DIR}"
project_name="${PROJECT_NAME:-$DEFAULT_PROJECT_NAME}"
php_version="${PHP_VERSION:-$DEFAULT_PHP_VERSION}"
admin_user_password="${ADMIN_USER_PASSWORD:-$DEFAULT_ADMIN_USER_PASSWORD}"
frontend_domain=""
backend_domain=""
unattended="${UNATTENDED:-false}"
verbose="${VERBOSE:-false}"

timestamp()
{
    date +"%Y-%m-%d %H:%M:%S"
}

version_ge()
{
    IFS='.' read -r -a a <<< "$1"
    IFS='.' read -r -a b <<< "$2"
    for i in 0 1 2; do
        ai=${a[i]:-0}
        bi=${b[i]:-0}
        if ((ai > bi)); then return 0; fi
        if ((ai < bi)); then return 1; fi
    done
    return 0
}

log_section()
{
    section="$1"
    printf "%b %b%s%b%b\n" \
        "${COLOR_GRAY}$(timestamp)${RESET}" \
        "${COLOR_BLUE}" "$section" "${RESET}" \
        "${RESET}"
    unset section
}

log_step()
{
    task="$1" \
        result="$2" \
        color="$3"
    printf "%b %b%s%b: %b%s%b\n" \
        "${COLOR_GRAY}$(timestamp)${RESET}" \
        "${COLOR_TASK}" "$task" "${RESET}" \
        "$color" "$result" "${RESET}"
    unset task
    unset result
    unset color
}

create_temp_file()
{
    if mktemp --help > /dev/null 2>&1; then
        mktemp
    else
        mktemp -t tmp.XXXXXXXXXX
    fi
}

exec_cmd()
{
    task="$1"

    shift

    if [[ "$verbose" == "true" ]]; then
        set +e
        {
            "$@"
        }
        status=$?
        set -e
    else
        temp_output_file=$(create_temp_file)

        set +e
        {
            "$@" 2>&1
        } > "$temp_output_file"
        status=$?
        set -e

        output=$(< "$temp_output_file")

        rm -f "$temp_output_file"
    fi

    unset temp_output_file

    if [[ $status -eq 0 ]]; then
        log_step "$task" "ok" "${COLOR_GREEN}"
        unset status
        unset task
    elif [[ "$verbose" == "true" ]]; then
        log_step "$task" "failed" "${COLOR_RED}"
        unset task
        exit $status
    else
        log_step "$task" "$output" "${COLOR_RED}"
        unset task
        exit $status
    fi
}

exit_on_missing_cmd()
{
    hash -r

    cmd="$1"
    install_hint="$2"

    command -v "$cmd" > /dev/null 2>&1 ||
        {
            log_step "Required command '$1' not found" "$install_hint" "${COLOR_RED}"
            unset cmd
            unset install_hint
            exit 1
        }

    unset cmd
    unset install_hint
}

print_help()
{
    cat << EOF
GSB11-Tenant Bootstrap Installer

Usage:
    $SCRIPT_NAME [options]

Options:
    --project-dir DIR           Project directory (env: PROJECT_DIR)
                                Default: $DEFAULT_PROJECT_DIR
    --project-name NAME         Project name and subdomain for URL (env: PROJECT_NAME)
                                Default: $DEFAULT_PROJECT_NAME
    --php-version VER           PHP version for DDEV (env: PHP_VERSION)
                                Default: $DEFAULT_PHP_VERSION
    --admin-user-password PASS  Admin user password (env: ADMIN_USER_PASSWORD)
                                Default: $DEFAULT_ADMIN_USER_PASSWORD
    -u, --unattended            Skip interactive prompts (env: UNATTENDED=true)
    -v, --verbose               Enable verbose mode (env: VERBOSE=true)
    -h, --help                  Show this help message and exit
EOF
}

parse_args()
{
    while [[ $# -gt 0 ]]; do
        case "$1" in
            -u | --unattended)
                unattended="true"
                shift
                ;;
            -v | --verbose)
                verbose="true"
                shift
                ;;
            --project-dir)
                project_dir="$2"
                shift 2
                ;;
            --project-name)
                project_name="$2"
                shift 2
                ;;
            --php-version)
                php_version="$2"
                shift 2
                ;;
            --admin-user-password)
                admin_user_password="$2"
                shift 2
                ;;
            -h | --help)
                print_help
                exit 0
                ;;
            *)
                log_step "Unknown option" "$1" "${COLOR_RED}"
                print_help
                exit 0
                ;;
        esac
    done
}

prompt_parameters()
{
    if [[ "$unattended" != "true" ]]; then
        log_step "Parameters" "enter the required information (or confirm the suggested value)" "${COLOR_YELLOW}"

        log_step "Project directory" "relative or absolute path to the project" "${COLOR_YELLOW}"
        echo -ne "[${COLOR_GRAY}${project_dir}${RESET}] > " >&2
        read -r input < /dev/tty

        if [[ $input = "" ]]; then
            project_dir="${DEFAULT_PROJECT_DIR}"
        else
            project_dir="$input"
        fi

        if [ -e "$project_dir" ]; then
            if [ -d "$project_dir" ]; then
                if [ "$(ls -A "$project_dir")" ]; then
                    log_step "Project directory" "Directory '$project_dir' is not empty" "${COLOR_RED}"
                    exit 1
                fi
            else
                log_step "Project directory" "It seems that you have not specified a directory at '$project_dir'." "${COLOR_RED}"
                exit 1
            fi
        fi

        log_step "DDEV Project name" "DDEV project name and subdomain '[SUBDOMAIN].${DEFAULT_DDEV_TLD}'" "${COLOR_YELLOW}"
        echo -ne "[${COLOR_GRAY}${project_name}${RESET}] " && read -r -p "> " input < /dev/tty
        project_name="${input:-project_name}"

        log_step "PHP version" "specify the PHP version to be used" "${COLOR_YELLOW}"
        echo -ne "[${COLOR_GRAY}${php_version}${RESET}] " && read -r -p "> " input < /dev/tty
        php_version="${input:-$php_version}"

        log_step "Admin user password" "enter the admin user password (hidden input)" "${COLOR_YELLOW}"
        if [[ "$admin_user_password" != "$DEFAULT_ADMIN_USER_PASSWORD" ]]; then
            echo -ne "[${COLOR_GRAY}HIDDEN${RESET}] " && read -r -s -p "> " input < /dev/tty
        else
            echo -ne "[${COLOR_GRAY}${DEFAULT_ADMIN_USER_PASSWORD}${RESET}] " && read -r -s -p "> " input < /dev/tty && echo
        fi
        admin_user_password="${input:-$admin_user_password}"
    fi
}

confirm_parameters()
{
    while [[ "$unattended" != "true" ]]; do
        log_step "Confirmation" "please review the information below" "${COLOR_YELLOW}"

        echo
        echo -e "    ${COLOR_GRAY}Project directory .....:${RESET} $project_dir"
        echo -e "    ${COLOR_GRAY}PHP version ...........:${RESET} $php_version"
        echo -e "    ${COLOR_GRAY}Frontend domain .......:${RESET} $frontend_domain"
        echo -e "    ${COLOR_GRAY}Backend domain ........:${RESET} $backend_domain"

        if [[ "$admin_user_password" != "$DEFAULT_ADMIN_USER_PASSWORD" ]]; then
            echo -e "    ${COLOR_GRAY}Admin user password ...:${RESET} [HIDDEN]"
        else
            echo -e "    ${COLOR_GRAY}Admin user password ...:${RESET} $DEFAULT_ADMIN_USER_PASSWORD"
        fi
        echo

        read -n 1 -r -s -p "Are these values correct? [y/N] " input < /dev/tty
        input="${input:-n}" && echo

        case "$input" in
            [Yy]*)
                break
                ;;
            *)
                log_step "User" "aborted" "${COLOR_RED}" &&
                    exit 1
                ;;
        esac
    done
}

check_prerequisites()
{
    log_section "Checking prerequisites"

    exit_on_missing_cmd git "see https://git-scm.com/downloads/"
    exit_on_missing_cmd docker "see https://docs.docker.com/get-docker/"
    exit_on_missing_cmd ddev "see https://ddev.readthedocs.io/"

    raw_ddev_version="$(ddev --version 2>&1 || echo '')"
    ddev_version="$(printf '%s\n' "$raw_ddev_version" | grep -Eo '[0-9]+\.[0-9]+\.[0-9]+' | head -n1 || echo "0.0.0")"

    if ! version_ge "$ddev_version" "$MIN_DDEV_VERSION"; then
        log_step "Verify ddev version" "error" "${COLOR_RED}"
        exit 1
    else
        log_step "Verify ddev version" "ok ($ddev_version)" "${COLOR_GREEN}"
    fi
}

detect_os()
{
    log_section "Detect OS"

    case "$(uname -s)" in
        Linux)
            if [[ -r /etc/os-release ]]; then
                . /etc/os-release
                log_step "Linux distro detected" "ok ($NAME $VERSION_ID)" "${COLOR_GREEN}"
            elif command -v lsb_release > /dev/null; then
                DISTRO="$(lsb_release -ds)"
                log_step "Unknown Linux distro ($DISTRO)" "proceeding anyway" "${COLOR_TASK}"
            else
                DISTRO="$(uname -s)"
                log_step "Unknown Linux distro ($DISTRO)" "proceeding anyway" "${COLOR_TASK}"
            fi
            ;;
        Darwin)
            log_step "macOS detected" "ok ($(sw_vers -productVersion))" "${COLOR_GREEN}"
            ;;
        *)
            log_step "Unsupported OS" "$(uname -s)" "${COLOR_RED}"
            exit 1
            ;;
    esac
}

bootstrap_project()
{
    log_section "Bootstrapping project"

    exec_cmd "Create project directory" mkdir -p "$project_dir"
    exec_cmd "Enter project directory" cd "$project_dir"

    log_section "Initializing DDEV configuration"
    exec_cmd "DDEV config" ddev config \
        --php-version "$php_version" \
        --docroot "$DEFAULT_DOCROOT" \
        --project-type "$DEFAULT_PROJECT_TYPE" \
        --project-name "$project_name" \
        --webimage-extra-packages "cron,exiftool,qpdf,php$php_version-opentelemetry,php$php_version-grpc"

    log_section "Starting DDEV environment"
    exec_cmd "ddev start" ddev start

    log_section "Create sitepackage via Composer"
    exec_cmd "Composer create-project" ddev composer create-project -y itzbund/gsb-sitepackage

    log_section "Copy TYPO3 htaccess template"
    exec_cmd "Copy htaccess" ddev exec cp vendor/typo3/cms-install/Resources/Private/FolderStructureTemplateFiles/root-htaccess "$DEFAULT_DOCROOT/.htaccess"

    log_section "Running TYPO3 initial setup"
    exec_cmd "TYPO3 setup" ddev typo3 setup --force \
        --no-interaction \
        --server-type='apache' \
        --driver='mysqli' \
        --username='db' \
        --password='db' \
        --port=3306 \
        --host='db' \
        --dbname='db' \
        --project-name="$project_name" \
        --admin-username='admin' \
        --admin-user-password="$admin_user_password" \
        --admin-email=''

    log_step "Security Note" "default admin password is for local dev only" "${COLOR_RED}"

    log_section "Importing initial DB for TYPO3"
    exec_cmd "ddev import-db" ddev import-db --file=.ddev/initial-setup/mysql-db.sql --no-drop
    exec_cmd "ddev database-update-schema" ddev typo3 database:updateschema

    log_section "Enabling TYPO3 extensions"
    exec_cmd "Extension setup" ddev typo3 extension:setup

    log_section "Copy placeholder image"
    exec_cmd "Create fileadmin/user_upload" ddev exec mkdir -p "$DEFAULT_DOCROOT/fileadmin/user_upload"
    exec_cmd "Set folder permissions" ddev exec chmod -R 2775 "$DEFAULT_DOCROOT/fileadmin"
    exec_cmd "Copy placeholder image" ddev exec cp Resources/Public/Images/placeholder_image.jpg "$DEFAULT_DOCROOT/fileadmin/user_upload/placeholder_image.jpg"

    log_section "Restarting DDEV environment to apply changes"
    exec_cmd "ddev restart" ddev start

    log_section "Launching site"
    if ! ddev launch /typo3 > /dev/null 2>&1; then
        printf "\nLinks (launch failed - please open manually):\n"
        printf " Frontend: https://%s\n" "$frontend_domain"
        printf " Backend: https://%s/typo3\n\n" "$backend_domain"
        log_step "Launch" "manual required" "${COLOR_RED}"
    else
        log_step "Launch" "ok" "${COLOR_GREEN}"
    fi

    log_step "GSB11 tenant setup complete! 🚀" "ok" "${COLOR_GREEN}"
}

ddev_project_exists()
{
    ddev list 2>&1 |
        perl -nE "say if /^│\ $1\ *│/" |
        grep -q .
}

sanitize_project_name()
{
    if [[ -d "$project_dir" ]]; then
        project_dir="$(realpath "$project_dir")"
    fi

    project_name_candidate="$project_name"
    project_name_suffix=0

    while ddev_project_exists "$project_name_candidate"; do
        project_name_candidate="${project_name}${project_name_suffix}"
        project_name_suffix=$((project_name_suffix + 1))
    done

    project_name="$project_name_candidate"
    frontend_domain="$project_name.$DEFAULT_DDEV_TLD"
    backend_domain="$project_name-backend.$DEFAULT_DDEV_TLD"
}

main()
{
    echo
    echo "╔════════════════════════════════════════════════════════════════╗"
    echo "║                        Welcome to GSB11                        ║"
    echo "╠════════════════════════════════════════════════════════════════╣"
    echo "║  A automated installer for your GSB11 development environment  ║"
    echo "╚════════════════════════════════════════════════════════════════╝"
    echo
    echo "This installer will help you:"
    echo
    echo "  • Detect your operating system and version"
    echo "  • Parse command-line options and environment variables"
    echo "  • Prompt interactively for any missing parameters"
    echo "  • Configure and start a DDEV project for TYPO3"
    echo "  • Install site dependencies via Composer"
    echo "  • Apply configuration patches to .ddev/config.yaml"
    echo "  • Launch your site or display manual URLs if auto-launch fails"
    echo

    check_prerequisites
    parse_args "$@"
    prompt_parameters
    sanitize_project_name
    confirm_parameters
    detect_os
    bootstrap_project
}

trap 'log_step "" "Interrupted" "${COLOR_RED}"; exit 1' INT TERM

main "$@"
