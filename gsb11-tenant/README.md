<!--
SPDX-FileCopyrightText: 2024 Bundesrepublik Deutschland, vertreten durch das BMI/ITZBund

SPDX-License-Identifier: GPL-3.0-or-later
-->

<!-- PROJECT SHIELDS -->
[![TYPO3 12](https://img.shields.io/badge/TYPO3-12-orange.svg)](https://get.typo3.org/version/12)

<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter">
    <img src="https://www.itzbund.de/SiteGlobals/Frontend/Images/logo.svg?__blob=normal&v=18" alt="Logo" width="300">
  </a>
  <p align="center">
    Jumpstart your GSB11 powered tenant development.
  </p>
</div>

# GSB11 Sitepackage Kickstarter

## Table of Contents

* [Overview](#overview)
* [Features Included](#features-included)
* [What's Not Included](#whats-not-included)
* [Getting Started](#getting-started)
* [Simplified Installation via Install Script](#simplified-installation-via-install-script)
* [Prerequisites](#prerequisites)
* [Installation Steps](#installation-steps)
* [Additional Resources](#additional-resources)
* [Contributing](#contributing)
* [License](#license)

---

## Overview

The **GSB11 Sitepackage Kickstarter** is a Composer root package that streamlines the setup of a local GSB11 tenant
development environment. Follow the steps below to:

- Scaffold a new GSB11 project
- Launch a Docker-based development setup with DDEV
- Install and configure TYPO3 with core GSB11 extensions
- Begin customizing your tenant configuration

---

## Features Included

After a successful setup, you'll have:

- **Core GSB11 components** (`itzbund/gsb-core`) with basic configuration
- **Accessibility enhancements** (`itzbund/a11y_backend`)
- **Accessible frontend** (without the official federal style guide) (`itzbund/gsb_public_frontend`)

---

## What's Not Included

The following packages are not included in the base installation but can be
installed thereafter using composer

- The official federal style-guide frontend (`itzbund/gsb_privat_frontend`) is private to authorities.\
  You can request access at: [https://produkt.gsb.bund.de/kontakt](https://produkt.gsb.bund.de/kontakt)
- Consent Management (`itzbund/gsb-consent`)
- Improved user management & security (`itzbund/gsb-feusermanagement`)
- Metadata cleaning to help prevent phishing (`itzbund/gsb-metadata-cleaner`)
- Search powered by Solr (`itzbund/gsb-solr`)
- Dashboard favorites widget (`itzbund/gsb-widgets`)

---

## Getting Started

### Simplified Installation via Install Script

You can bootstrap your GSB11 tenant in one step by piping our install script to bash. This will download and run
`install.sh` with sensible defaults:

```bash
# Using curl
curl -sL https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/raw/main/install.sh?ref_type=heads | bash

# Or using wget
wget -qO- https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/raw/main/install.sh?ref_type=heads | bash
```

> [!TIP] Note:
> `curl -sL https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/raw/main/install.sh?ref_type=heads | bash -s -- -h`
> will show the script's help menu (-h) without requiring you to download it first.

### Prerequisites

Ensure you have the following installed on your machine:

#### Supported Operating Systems

- CentOS 9 / CentOS 10
- Debian 11 "Bullseye" / Debian 12 "Bookworm"
- Fedora 42
- macOS 15.5 "Sequoia"
- Ubuntu 22.04 "Jammy Jellyfish" / Ubuntu 24.04 "Noble Numbat"

#### Required Tools

- [Git](https://git-scm.com/)
- [Docker](https://docs.docker.com/)
- [DDEV](https://ddev.readthedocs.io/) (_>= 1.24.2_)

> [!IMPORTANT] Windows Users:
> Run DDEV inside WSL2 and execute commands in the Linux shell.

---

### Installation Steps

1. **Create project directory**

```bash
mkdir gsb11-tenant && cd $_
```

2. **Initialize DDEV configuration**

```bash
ddev config --php-version 8.3 --docroot .build/public --project-type typo3 --webimage-extra-packages "cron,exiftool,qpdf,php8.3-opentelemetry,php8.3-grpc"
```


3. **Start DDEV**

```bash
ddev start
```

4. **Install the sitepackage**

```bash
ddev composer create-project --remove-vcs itzbund/gsb-sitepackage
```

5. **restart to apply enviroment**

```bash
ddev restart
```

6. **Setup TYPO3 & GSB11**

```bash
ddev exec cp vendor/typo3/cms-install/Resources/Private/FolderStructureTemplateFiles/root-htaccess .build/public/.htaccess && \
ddev typo3 setup --force \
    --no-interaction \
    --server-type='apache' \
    --driver='mysqli' \
    --username='db' \
    --password='db' \
    --port=3306 \
    --host='db' \
    --dbname='db' \
    --project-name="GSB11" \
    --admin-username='admin' \
    --admin-user-password='§Chang3Me§' \
    --admin-email=''
```

> [!WARNING] Security Note:
> This password is only for local development. Use a strong, secure password in production.

7. **Import initial database and update schema**

```bash
ddev import-db --file=.ddev/initial-setup/mysql-db.sql --no-drop && \
ddev typo3 database:updateschema
```

8. **Enable all extensions**

```bash
ddev exec vendor/bin/typo3 extension:setup
```

9. **Copy placeholder image**

```bash
ddev exec mkdir -p ".build/public/fileadmin/user_upload" && \
ddev exec chmod -R 2775 ".build/public/fileadmin" && \
ddev exec cp Resources/Public/Images/placeholder_image.jpg ".build/public/fileadmin/user_upload/placeholder_image.jpg"
```

10. **Launch the site**

```bash
ddev launch
```

Alternatively, visit: [gsb11-tenant.ddev.site](https://gsb11-tenant.ddev.site)

11. **Access the TYPO3 backend**

```bash
ddev launch /typo3
```

Use the admin credentials from step 6. \
Alternatively, visit: [gsb11-tenant.ddev.site/typo3](https://gsb11-tenant.ddev.site/typo3)

10. **Start customizing!** 🚀

---

## Additional Resources

- **Tenant Factsheet:**\
  [https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/blob/main/FACTSHEET.md](https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/blob/main/FACTSHEET.md)
- **Extension READMEs:** See each extension's own README for detailed usage.
- **CI/CD & Caching Docs:** Available in the main GSB11 GitLab project.

---

## Contributing

We welcome your contributions! Please follow our [Contribution Walkthrough](https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gitlab-profile/-/blob/main/CONTRIBUTING.md) to get started.

---

## License

This project is licensed under the [GPL-3.0-or-later](https://spdx.org/licenses/GPL-3.0-or-later.html).
