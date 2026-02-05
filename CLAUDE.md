# CLAUDE.md — GSB11 lokale Installation

## Projektziel

Lokale Installation des Government Site Builder 11 (GSB11) für Entwicklungs- und Testzwecke. Der GSB11 ist das TYPO3-basierte CMS der deutschen Bundesverwaltung. Wir nutzen den offiziellen Sitepackage Kickstarter über DDEV.

## Voraussetzungen

Stelle sicher, dass folgende Tools installiert und lauffähig sind, bevor du mit der Installation beginnst:

- Git
- Docker (Desktop oder Engine)
- DDEV >= 1.24.2

Prüfe mit:
```bash
git --version && docker --version && ddev --version
```

Falls DDEV nicht installiert ist:
```bash
# macOS
brew install ddev/ddev/ddev

# Linux (Ubuntu/Debian)
curl -fsSL https://pkg.ddev.com/apt/gpg.key | gpg --dearmor | sudo tee /etc/apt/keyrings/ddev.gpg > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/ddev.gpg] https://pkg.ddev.com/apt/ * *" | sudo tee /etc/apt/sources.list.d/ddev.list
sudo apt update && sudo apt install -y ddev
```

Windows-Nutzer: DDEV innerhalb von WSL2 ausführen, alle Befehle in der Linux-Shell.

## Schnellinstallation (Ein-Schritt-Variante)

Der Sitepackage Kickstarter bietet ein Installationsskript, das alles automatisch einrichtet:

```bash
curl -sL https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/raw/main/install.sh?ref_type=heads | bash
```

Das Skript fragt nach Projektpfad, PHP-Version (Standard: 8.3) und Admin-Passwort. Danach läuft alles automatisch.

Hilfe anzeigen ohne Download:
```bash
curl -sL https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/raw/main/install.sh?ref_type=heads | bash -s -- -h
```

## Manuelle Installation (Schritt für Schritt)

Falls die automatische Installation fehlschlägt oder du mehr Kontrolle brauchst:

### Schritt 1: Projektverzeichnis erstellen
```bash
mkdir gsb11-tenant && cd $_
```

### Schritt 2: DDEV konfigurieren
```bash
ddev config --php-version 8.3 --docroot .build/public --project-type typo3 --webimage-extra-packages "cron,exiftool,qpdf,php8.3-opentelemetry,php8.3-grpc"
```

### Schritt 3: DDEV starten
```bash
ddev start
```

### Schritt 4: Sitepackage installieren
```bash
ddev composer create-project --remove-vcs itzbund/gsb-sitepackage
```

### Schritt 5: DDEV neu starten (Environment laden)
```bash
ddev restart
```

### Schritt 6: TYPO3 und GSB11 einrichten
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

### Schritt 7: Datenbank importieren und Schema aktualisieren
```bash
ddev import-db --file=.ddev/initial-setup/mysql-db.sql --no-drop && \
ddev typo3 database:updateschema
```

### Schritt 8: Extensions aktivieren
```bash
ddev exec vendor/bin/typo3 extension:setup
```

### Schritt 9: Platzhalter-Bild kopieren
```bash
ddev exec mkdir -p ".build/public/fileadmin/user_upload" && \
ddev exec chmod -R 2775 ".build/public/fileadmin" && \
ddev exec cp Resources/Public/Images/placeholder_image.jpg ".build/public/fileadmin/user_upload/placeholder_image.jpg"
```

### Schritt 10: Website starten
```bash
ddev launch
```

### Schritt 11: TYPO3 Backend öffnen
```bash
ddev launch /typo3
```
Login: admin / §Chang3Me§ (oder das gewählte Passwort)

## Was nach der Installation enthalten ist

Die Basis-Installation bringt mit:
- **gsb-core** (itzbund/gsb-core): Kernfunktionalität und Konfiguration
- **a11y_backend** (itzbund/a11y_backend): Barrierefreiheits-Verbesserungen im Backend
- **gsb_public_frontend** (itzbund/gsb_public_frontend): Öffentliches Frontend (ohne offiziellen Styleguide des Bundes)

## Optionale Extensions nachinstallieren

Nach der Basis-Installation können folgende Extensions per Composer ergänzt werden:

```bash
# Solr-Suche
ddev composer require itzbund/gsb-solr

# Widgets für das Dashboard
ddev composer require itzbund/gsb-widgets

# Benutzerverwaltung und Sicherheit
ddev composer require itzbund/gsb-feusermanagement

# Consent-Management
ddev composer require itzbund/gsb-consent

# Metadaten-Bereinigung (Phishing-Schutz)
ddev composer require itzbund/gsb-metadata-cleaner

# RSS-Feeds
ddev composer require itzbund/gsb-rss

# Clustered Caching (für Produktivumgebungen)
ddev composer require itzbund/gsb-clustered-caching
```

Nach jeder Extension-Installation:
```bash
ddev exec vendor/bin/typo3 extension:setup && \
ddev typo3 database:updateschema
```

## Hinweis: Offizieller Styleguide des Bundes

Das offizielle Frontend-Paket `itzbund/gsb_privat_frontend` (Styleguide des Bundes) ist nicht öffentlich verfügbar. Zugang kann beantragt werden unter: https://produkt.gsb.bund.de/kontakt

## Feature Flags

Der GSB11 verwendet Feature Flags zur Steuerung von Funktionen. Konfiguration erfolgt in der `.env`-Datei oder in `local-dev/.ddev/docker-compose.environment.yaml`.

## Wichtige Quellen

- Repository: https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter
- Extensions-Übersicht: https://gitlab.opencode.de/bmi/government-site-builder-11/extensions
- Packagist: https://packagist.org/packages/itzbund/gsb-sitepackage
- Factsheet: https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/blob/main/FACTSHEET.md
- Contribution Guide: https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gitlab-profile/-/blob/main/CONTRIBUTING.md
- Installationsanleitung (network.publishing): https://www.network-publishing.de/blog/gsb11-lokale-installation.html

## Fehlerbehebung

- **DDEV startet nicht**: `docker info` prüfen, ggf. Docker Desktop neu starten
- **Composer-Fehler bei itzbund-Paketen**: OpenCoDE GitLab muss als Composer-Domain registriert sein. Das Installationsskript macht das automatisch. Manuell: `ddev composer config -g gitlab-domains gitlab.opencode.de`
- **Datenbank-Fehler nach Extension-Installation**: `ddev typo3 database:updateschema` ausführen
- **Seite zeigt 503**: `ddev restart` und prüfen ob alle Extensions aktiviert sind mit `ddev exec vendor/bin/typo3 extension:list`
- **PHP-Version-Konflikt**: GSB11 benötigt PHP 8.3. In `.ddev/config.yaml` prüfen: `php_version: "8.3"`

## Aktuelle Version

- GSB Sitepackage: v8.5.1-rc.4 (Stand: 03.02.2026)
- Basiert auf: TYPO3 12 LTS
- Abhängigkeiten: itzbund/gsb-minimal 2.4.2, itzbund/gsb-public-frontend 2.3.0
