# GSB11 Local Development

Lokale Installation des **Government Site Builder 11** (GSB11) - das TYPO3-basierte CMS der deutschen Bundesverwaltung.

## Quick Start

Diese Installation nutzt [DDEV](https://ddev.com/) als lokale Entwicklungsumgebung. Der Sitepackage Kickstarter konfiguriert automatisch einen vollständigen DDEV-Stack mit PHP 8.3, MySQL und allen benötigten Tools.

```bash
curl -sL https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter/-/raw/main/install.sh | bash
```

Nach der Installation: `ddev launch` für das Frontend, `ddev launch /typo3` für das Backend.

## Documentation

- **[Hands-On Guide](docs/gsb11-hands-on-guide.md)** - GSB11 on Your Laptop in 10 Minutes
- **[Sitepackage README](gsb11-tenant/README.md)** - Official GSB11 Sitepackage Kickstarter documentation
- **[FACTSHEET](gsb11-tenant/FACTSHEET.md)** - Feature overview

## Requirements

- Git
- Docker (Desktop or Engine)
- DDEV >= 1.24.2

## Version

- GSB Sitepackage: v8.5.1-rc.4
- TYPO3: 12 LTS
- PHP: 8.3

## Links

- [OpenCoDE Repository](https://gitlab.opencode.de/bmi/government-site-builder-11/extensions/gsb-sitepackage-kickstarter)
- [Extensions Overview](https://gitlab.opencode.de/bmi/government-site-builder-11/extensions)
- [Packagist](https://packagist.org/packages/itzbund/gsb-sitepackage)

## License

GPL-2.0-or-later
