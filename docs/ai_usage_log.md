# AI usage log

## 2026-11-24 — SHOP-2 project foundation

- Tool: Codex.
- Task: initialize ShopLite and prepare its architecture, code quality, themes,
  placeholder home screen, and README.
- Prompt summary: set up an empty Flutter project, then create the required
  feature-first Clean Architecture directories, configure linting, build a themed
  placeholder, and write setup and architecture documentation.
- Changes accepted for this implementation: generated the empty Flutter project;
  added the required folders with `.gitkeep` files; enabled both const lint rules;
  added Material 3 system light/dark themes and a placeholder screen; added a
  widget test for appearance changes; documented setup, architecture, and checks;
  extended ignore rules for local configuration and signing secrets.
- Changes rejected or deferred: no runtime packages, feature logic, API calls, or
  routing were added. Jira, remote branch protection, PR creation, and merging
  are outside this implementation request.
- Review: implementation awaits developer and mentor review.
- Validation: formatting clean, `flutter analyze` reports zero issues, widget test
  passes, and Android debug APK builds and launches on an Android 16 emulator.
  Device light/dark switching was checked and screenshots saved in
  `docs/screenshots/`.
