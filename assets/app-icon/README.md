# Lunola Folio app icon

<img src="lunola-folio-256.png" alt="Lunola Folio app icon: a glossy neon-glass letter F on an aurora gradient tile" width="128">

**Subject:** a stylised capital **F**, built from translucent, neon-edged ribbon strokes, on a
rounded-square tile.

**Style:** hyper-glossy glassmorphism. A vivid aurora gradient sweeps the tile — warm yellow and
orange at the upper left, through coral and magenta, to violet and blue at the lower right — with
soft darker wave bands behind the letter, a broad white reflection across the top, and a rim light
that traces the rounded perimeter. A four-pointed sparkle sits at the upper right of the F.

**Palette:** the Lunola Folio aurora gradient.

| Colour | Role |
|---|---|
| Yellow / orange | the gradient's upper-left edge and the sparkle's core |
| Coral / magenta | the upper band and the F's middle strokes |
| Violet / blue | the lower-right field and the F's rounded stroke ends |
| Cyan | rim light along the bottom edge |

**Tile:** a rounded square (squircle) with a raised, button-like border. Windows and Linux icons use
the full-bleed tile. macOS icons put it on Apple's icon grid (an 824 px body centred on a transparent
1024 px canvas).

**Provenance:** the product owner's original artwork for the Lunola Folio rebrand. Every PNG, `.ico`
and `.icns` here is downsampled from `lunola-folio-1024.png` with Lanczos filtering, preserving
transparency; the icons are never recoloured or reinterpreted. Licence: [LICENSE.txt](LICENSE.txt)
(`MIT OR Apache-2.0`, like the repo).

## Files

| File | What it is |
|---|---|
| `lunola-folio-1024.png` | the master raster (1024 px on Apple's grid); also the runtime Dock icon on macOS |
| `lunola-folio-<n>.png` | 16, 32, 48, 64, 128, 256 and 512 px, downsampled from the master |
| `lunola-folio.icns` | macOS icon (16–1024 px) |
| `lunola-folio.ico` | Windows icon (16–256 px), embedded in `lunola-folio.exe` by `apps/lunola-folio/build.rs` |
| `lunola-folio-document.svg` | Windows PDF file icon master: a Lucide document outline with a badge and outlined PDF lettering; no font dependency |
| `lunola-folio-document.ico` | Windows PDF file icon (16–256 px), embedded as resource 2 in `lunola-folio.exe` |
| `hicolor/<n>x<n>/apps/dev.pujosety.lunola-folio.png` | Linux hicolor theme, 16–1024 px; the 256 px one is the runtime icon on Windows and Linux |

Where it shows: `apps/lunola-folio/src/main.rs` sets the window icon (Dock, taskbar, Alt-Tab, launcher)
and the Wayland app id `dev.pujosety.lunola-folio`;
`packaging/linux/dev.pujosety.lunola-folio.desktop` names the hicolor icon.

Windows PDF files use resource 2 (`"lunola-folio.exe",-2`) when Lunola Folio is chosen as the default
reader; the app keeps resource 1. The document outline is adapted from Lucide `file-text`
1.49.0 (ISC); its badge and outlined lettering are original (`MIT OR Apache-2.0`), covered by
[LICENSE-document.txt](LICENSE-document.txt). Both icons are embedded, requiring no runtime
sidecar. This provides a file type icon; first-page thumbnails still need a thumbnail provider.

## Regenerate

```sh
./generate-icons.sh       # downsamples every size from the master PNG (needs python3 + Pillow)
```

The master is `lunola-folio-1024.png`; the script is idempotent and never recolours the artwork.
