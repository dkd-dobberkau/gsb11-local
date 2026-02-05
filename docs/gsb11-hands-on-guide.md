# GSB11 on Your Laptop in 10 Minutes: A Hands-On Guide for TYPO3 Developers

You have probably heard about Germany's Government Site Builder 11. Maybe at a conference, maybe in a podcast, maybe from a client who suddenly needs "GSB compliance." What you may not have heard is how straightforward it is to get the thing running locally and start poking around.

No procurement process required. No access request. No waiting for anyone's approval. Just your terminal, Docker, and ten minutes.

I recently went through this myself, partly out of curiosity as TYPO3 Association President, partly because dkd is actively working with clients who need GSB11 expertise. What surprised me was how little friction there actually is, once you know where to look. So here is the walkthrough I wish I had found six months ago.

## What you need

Three tools, all free:

- **Git** (you have this)
- **Docker** (Desktop or Engine, running)
- **DDEV** >= 1.24.2

Quick sanity check:

```bash
git --version && docker --version && ddev --version
```

If DDEV is missing, on macOS it is `brew install ddev/ddev/ddev`. On Ubuntu/Debian, the install instructions are at https://ddev.readthedocs.io. Windows users: run everything inside WSL2.

## Install it

The GSB11 team provides a Sitepackage Kickstarter with an install script that handles everything: scaffolding, DDEV configuration, Composer install, TYPO3 setup, database import, extension activation. One command:

```bash
curl -sL https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/raw/main/install.sh | bash
```

The script asks three things: where to put the project, which PHP version (stick with 8.3), and an admin password for the TYPO3 backend. Confirm, wait for the output to settle, open the URL it gives you. You are looking at a GSB11 instance on your machine.

Want to see the help menu before committing?

```bash
curl -sL https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/raw/main/install.sh | bash -s -- -h
```

## What happens under the hood

If you want to understand what the script actually does, or if you need to debug a failed installation, here is the sequence broken down. These are the same steps the install script runs, just laid out so you can see each one:

**Project scaffolding.** The script creates a directory, initializes DDEV with PHP 8.3, sets the docroot to `.build/public`, and adds packages like exiftool and qpdf to the web container. The DDEV project type is set to `typo3`.

```bash
mkdir gsb11-tenant && cd $_
ddev config --php-version 8.3 --docroot .build/public --project-type typo3 \
  --webimage-extra-packages "cron,exiftool,qpdf,php8.3-opentelemetry,php8.3-grpc"
ddev start
```

**Composer install.** The sitepackage is pulled from Packagist. It brings in `gsb-minimal` and `gsb-public-frontend` as dependencies, which in turn pull gsb-core, a11y_backend, and all their TYPO3 requirements.

```bash
ddev composer create-project --remove-vcs itzbund/gsb-sitepackage
ddev restart
```

**TYPO3 setup.** The `.htaccess` is copied from the TYPO3 install resources, and `typo3 setup` configures the database connection, project name, and admin credentials. All values point to the DDEV-managed MySQL container.

```bash
ddev exec cp vendor/typo3/cms-install/Resources/Private/FolderStructureTemplateFiles/root-htaccess .build/public/.htaccess
ddev typo3 setup --force --no-interaction \
    --server-type='apache' --driver='mysqli' \
    --username='db' --password='db' --port=3306 --host='db' --dbname='db' \
    --project-name="GSB11" \
    --admin-username='admin' --admin-user-password='Chang3Me!' --admin-email=''
```

**Database and extensions.** An initial SQL dump is imported on top of the fresh database, the schema is updated to match all installed extensions, and then every extension is activated.

```bash
ddev import-db --file=.ddev/initial-setup/mysql-db.sql --no-drop
ddev typo3 database:updateschema
ddev exec vendor/bin/typo3 extension:setup
```

**Assets.** A placeholder image is copied into fileadmin so content elements have something to render.

```bash
ddev exec mkdir -p ".build/public/fileadmin/user_upload"
ddev exec chmod -R 2775 ".build/public/fileadmin"
ddev exec cp Resources/Public/Images/placeholder_image.jpg ".build/public/fileadmin/user_upload/placeholder_image.jpg"
```

**Open it.** Frontend at the DDEV project URL, backend at `/typo3` with the credentials from the setup step.

```bash
ddev launch        # Frontend
ddev launch /typo3  # Backend
```

Nothing in this sequence is GSB-specific magic. It is DDEV, Composer, and the TYPO3 CLI. If any step fails, you know exactly where to look.

## What you are looking at

Once the installation is done, your local GSB11 ships with three core components:

**gsb-core** is the heart of the system. It extends TYPO3 12 LTS with GSB-specific configuration, site package management, and feature flag support. It is not a fork. It does not replace TYPO3 internals. It layers on top.

**a11y_backend** adds accessibility improvements to the TYPO3 backend itself. This is one of those things that sounds minor but matters enormously in a context where editors may rely on screen readers or keyboard navigation.

**gsb_public_frontend** provides the public-facing templates and content elements. What you will not see is the official federal design. The Styleguide des Bundes (`gsb_privat_frontend`) requires access authorization, which makes sense given it is tied to the federal government's visual identity. You can request access at https://produkt.gsb.bund.de/kontakt.

## Adding more extensions

The base install is deliberately minimal. The interesting parts come when you start adding modules:

```bash
# Search powered by Apache Solr
ddev composer require itzbund/gsb-solr

# Dashboard widgets
ddev composer require itzbund/gsb-widgets

# User management and security hardening
ddev composer require itzbund/gsb-feusermanagement

# Cookie/consent management
ddev composer require itzbund/gsb-consent

# RSS feed generation
ddev composer require itzbund/gsb-rss
```

After each install, run:

```bash
ddev exec vendor/bin/typo3 extension:setup && \
ddev typo3 database:updateschema
```

Every one of these extensions lives on OpenCoDE (https://gitlab.opencode.de/bmi/government-site-builder-11/extensions) and is published on Packagist. Standard Composer workflow, nothing exotic.

## What makes this different from a regular TYPO3 project

If you have built TYPO3 sites before, you will feel at home immediately. The backend is TYPO3. The TypoScript is TYPO3. The Fluid templates are TYPO3. There is no abstraction layer that hides the CMS from you.

What is different is the layer of convention and configuration on top. Feature flags control which functionality is available, and they can be toggled in your `.env` file or DDEV environment config. The GSB extensions are designed to be composed: pick what you need, leave what you do not.

The most significant architectural choice is the site package concept in gsb-core. A package qualifies as a GSB site package if its extension key includes `gsb_core` or `site`, or if it declares itself via `composer.json`. Once selected, its TypoScript configuration becomes the root template automatically, enabling zero-configuration deployments in clustered environments.

## The elephant in the room

You will notice that the official federal frontend is gated. Some repositories on OpenCoDE are not publicly accessible. If you have followed the recent Working Draft podcast episode on this topic, you know this tension between "100% Open Source" and the practical reality of restricted components is a real discussion in the community.

My take: the code that matters for understanding, evaluating, and developing against the GSB11 is open. The installation path I described above works without any special access. What is gated is primarily visual identity and deployment-specific configuration for the federal infrastructure. Whether that is enough openness is a legitimate debate, and one I have written about separately.

For now, as a developer, you have everything you need to build, test, and learn.

## Where to go from here

Once your local instance is running, here are some things worth exploring:

Read the **Factsheet** at https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/blob/main/FACTSHEET.md for a complete overview of what ships in the sitepackage.

Browse the **extension READMEs** on OpenCoDE. Each extension documents its feature flags, configuration options, and integration points.

If you want to contribute, the **Contribution Walkthrough** at https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gitlab-profile/-/blob/main/CONTRIBUTING.md explains the process.

And if you are evaluating whether GSB11 is relevant for your organization or your clients: it is TYPO3. If you know TYPO3, you already know 90% of what you need. The remaining 10% is convention, not complexity.

## The version you are installing

As of early February 2026, the Sitepackage Kickstarter is at v8.5.1-rc.4. It pulls gsb-minimal 2.4.2 and gsb-public-frontend 2.3.0. The underlying CMS is TYPO3 12 LTS with PHP 8.3. The project uses quarterly major releases, so expect regular updates.

---

*Olivier Dobberkau is CEO and Founder of dkd Internet Service GmbH in Frankfurt and President of the TYPO3 Association. He has been building open-source solutions for enterprises and public institutions for over 25 years.*
