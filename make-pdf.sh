#!/bin/bash
# Makes GoogleGlass_CanPamukcu.pdf: one page per slide, each page an exact picture of the slide on screen
# (glows, shadows and glass included), so it looks the same in Preview, Acrobat, WeChat or the course site.
# Needs Google Chrome and ffmpeg. Run it again after you change any slide.
DIR="$(cd "$(dirname "$0")" && pwd)"; cd "$DIR" || exit 1
CHROME="/Applications/Google Chrome.app/Contents/MacOS/Google Chrome"
[ -x "$CHROME" ] || { echo "Google Chrome not found"; exit 1; }
command -v ffmpeg >/dev/null || { echo "ffmpeg not found (brew install ffmpeg)"; exit 1; }
TMP="$(mktemp -d)"; trap 'rm -rf "$TMP"' EXIT
URL="file://$DIR/index.html"

for n in 0 1 2 3 4 5 6; do
  echo "slide $((n+1)) / 7"
  "$CHROME" --headless=new --user-data-dir="$TMP/profile" --hide-scrollbars --force-device-scale-factor=2 \
    --window-size=1920,1080 --virtual-time-budget=5000 --screenshot="$TMP/s$n.png" "$URL?preview=pdf#$n" >/dev/null 2>&1
  ffmpeg -v error -y -i "$TMP/s$n.png" -q:v 2 "$TMP/s$n.jpg"
done

{ echo '<!doctype html><meta charset="utf-8"><style>@page{size:1920px 1080px;margin:0}html,body{margin:0;background:#05070c}'
  echo 'img{display:block;width:1920px;height:1080px;break-after:page}</style>'
  for n in 0 1 2 3 4 5 6; do echo "<img src=\"s$n.jpg\">"; done; } > "$TMP/pdf.html"

"$CHROME" --headless=new --user-data-dir="$TMP/profile" --no-pdf-header-footer --virtual-time-budget=5000 \
  --print-to-pdf="$DIR/GoogleGlass_CanPamukcu.pdf" "file://$TMP/pdf.html" >/dev/null 2>&1
ls -lh "$DIR/GoogleGlass_CanPamukcu.pdf" | awk '{print "done: GoogleGlass_CanPamukcu.pdf ("$5")"}'
