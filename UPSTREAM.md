# Upstream

Lunola Folio is a rebranded, independently maintained product built on an existing open-source
PDF application. This file records that lineage truthfully, so the work of the original authors is
never obscured and the rebranding work is never misattributed.

## What this repository is

- **Product:** Lunola Folio — "Documents, made delightful."
- **Maintainer:** [pujosety](https://github.com/pujosety)
- **Repository:** https://github.com/pujosety/Lunola-Folio
- **Support:** GitHub Issues (https://github.com/pujosety/Lunola-Folio/issues)

## Upstream lineage

Lunola Folio's codebase originates from the open-source **PdfCraft** project, which was developed in
public by its own team and community. The majority of the engine, rendering, editing, forms,
signing, accessibility, localisation and packaging work in this repository was written by those
upstream authors.

The Lunola Folio rebrand changed the product's **identity**: the name, the wordmark and app icons,
the tagline, the support and community surfaces, the installer and bundle metadata, the desktop
integration files, and the user-facing copy in the documentation. It did **not** rewrite the
underlying PDF implementation.

## Attribution rules for this repository

- Required copyright, author and licence notices are **retained**. See `LICENSE-MIT`,
  `LICENSE-APACHE`, `NOTICE`, `ATTRIBUTION.md` and `ATTRIBUTION.toml`.
- Git history is **not** rewritten to conceal original authorship. The commits that built the
  codebase are intact, under their original authors.
- The About dialog's contributor table reports the project's real commit history. Its heading says
  explicitly that the history predates the rebrand, so it is not read as the authorship of the
  rebranding work.
- The current maintainer does **not** claim to have written the original application.
- No contributor is labelled as a contributor to the Lunola-specific rebranding work unless they
  actually contributed to it.

## Rebranding work (Lunola Folio)

| Change | Where |
|---|---|
| Product name, tagline and user-facing copy | app UI, `README.md`, `ROADMAP.md`, `docs/` |
| App icon set (PNG, ICO, ICNS, hicolor, favicon) | `assets/app-icon/` |
| Product identifier `dev.pujosety.lunola-folio` | `apps/lunola-folio/src/main.rs`, macOS/Windows/Linux packaging |
| Support surfaces: GitHub Issues replaces the old chat/community links | `crates/engine/src/links.rs`, `crates/engine/src/commands.rs`, Help menu, About dialog, CLI, MCP |
| Application directories `apps/pdfcraft*` → `apps/lunola-folio*` | `apps/`, `Cargo.toml` |
| Documentation and packaging copy | `docs/`, `packaging/`, `assets/app-icon/README.md` |

## Note on internal identifiers

Internal Rust crate names remain `pdfcraft-*` (for example `pdfcraft-engine`, `pdfcraft-ui-egui`).
This is deliberate: renaming them would touch every `use` statement and every inter-crate
dependency without changing anything a user sees. See `docs/architecture.md` for the crate map.

## Licences

Lunola Folio is dual-licensed under MIT or Apache-2.0, at your option, and keeps the upstream
project's licence terms. The Lunola brand assets are trademarks and are **not** open source — see
`docs/brand/LICENSE-brand.txt`.
