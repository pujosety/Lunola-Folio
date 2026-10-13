#!/usr/bin/env bash
# Build Lunola Folio for FreeBSD and package it:
#   $DIST/lunola-folio-<version>-freebsd-<arch>.tar.gz   a /usr/local-style tree (bin/, share/)
#
# Extract it into /usr/local (or anywhere, and run bin/lunola-folio from there). The desktop entry,
# MIME type, AppStream metadata and icons are the freedesktop ones Linux uses.
#
# Usage: packaging/freebsd/package.sh [--skip-build]
# Needs: bash, a Rust toolchain, curl and the network (the OCR models), and the GUI libraries in .github/workflows/freebsd.yml.
set -euo pipefail
# shellcheck source=../env.sh
. "$(dirname "${BASH_SOURCE[0]}")/../env.sh"
LINUX="$ROOT/packaging/linux"
APP_ID=dev.pujosety.lunola-folio

SKIP_BUILD=0
while [ $# -gt 0 ]; do
  case "$1" in
    --skip-build) SKIP_BUILD=1; shift ;;
    -h | --help) sed -n '2,9p' "$0"; exit 0 ;;
    *) echo "unknown argument: $1" >&2; exit 2 ;;
  esac
done

ARCH="$(uname -m)"
case "$ARCH" in
  amd64 | x86_64) ARCH=x86_64 ;;
  arm64 | aarch64) ARCH=aarch64 ;;
  *) echo "unsupported architecture $ARCH" >&2; exit 2 ;;
esac
BASENAME="lunola-folio-$VERSION-freebsd-$ARCH"

echo "==> Lunola Folio $VERSION for FreeBSD $ARCH"

if [ "$SKIP_BUILD" = 0 ]; then
  (cd "$ROOT" && cargo build --release --locked -p lunola-folio -p lunola-folio-cli)
fi
BIN="$CARGO_TARGET_DIR/release"
WORK="$CARGO_TARGET_DIR/freebsd-package"
STAGE="$WORK/$BASENAME"
rm -rf "$WORK"

# FreeBSD's install(1) has no -D: create the directories first.
mkdir -p "$STAGE/bin" "$STAGE/share/applications" "$STAGE/share/mime/packages" "$STAGE/share/metainfo" \
  "$STAGE/share/icons" "$STAGE/share/doc/lunola-folio"
install -m 755 "$BIN/lunola-folio" "$BIN/lunola-folio-cli" "$STAGE/bin/"
strip "$STAGE/bin/lunola-folio" "$STAGE/bin/lunola-folio-cli" 2>/dev/null || true
install -m 644 "$LINUX/$APP_ID.desktop" "$STAGE/share/applications/$APP_ID.desktop"
install -m 644 "$LINUX/$APP_ID.mime.xml" "$STAGE/share/mime/packages/$APP_ID.xml"
sed -e "s/@VERSION@/$VERSION/g" -e "s/@DATE@/$PDFCRAFT_BUILD_DATE/g" \
  "$LINUX/$APP_ID.metainfo.xml.in" >"$STAGE/share/metainfo/$APP_ID.metainfo.xml"
cp -R "$ROOT/assets/app-icon/hicolor" "$STAGE/share/icons/"
copy_docs "$STAGE/share/doc/lunola-folio"
# OCR models: the app finds them at <bin>/../share/lunola-folio/models.
stage_models "$STAGE/share/lunola-folio/models"

"$STAGE/bin/lunola-folio" --version
mkdir -p "$DIST"
tar -C "$WORK" -czf "$DIST/$BASENAME.tar.gz" "$BASENAME"
echo "wrote $DIST/$BASENAME.tar.gz"
