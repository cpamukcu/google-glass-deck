#!/bin/bash
# Prepares the media for the deck. Run it again whenever you add or change a file in media/.
#  1. V1..V4.mp4  -> V#_rev.mp4  (same move played backwards, for the Back button; no sound)
#  2. K1..K7.png  -> media/keyframes/web/K#.jpg  (1920 px, lighter, used by the deck and the PDF)
#  3. reference photos -> assets/img/ (max 1600 px, JPG 80%)
DIR="$(cd "$(dirname "$0")" && pwd)"; cd "$DIR" || exit 1
command -v ffmpeg >/dev/null || { echo "ffmpeg not found (brew install ffmpeg)"; exit 1; }

for n in 1 2 3 4; do
  V="media/V$n.mp4"; R="media/V${n}_rev.mp4"
  [ -f "$V" ] || continue
  if [ ! -f "$R" ] || [ "$V" -nt "$R" ]; then
    echo "reverse  $V"
    ffmpeg -v error -y -i "$V" -vf reverse -an -c:v libx264 -crf 18 -pix_fmt yuv420p -movflags +faststart "$R"
  fi
done

mkdir -p media/keyframes/web
for n in 1 2 3 4 5 6 7; do
  K="media/keyframes/K$n.png"; J="media/keyframes/web/K$n.jpg"
  [ -f "$K" ] || continue
  if [ ! -f "$J" ] || [ "$K" -nt "$J" ]; then
    echo "keyframe $K"
    ffmpeg -v error -y -i "$K" -vf "scale=1920:-2" -q:v 3 "$J"
  fi
done

# slide 1 has no image of its own: it rests on the first frame of V1, so Next starts the video with no jump
if [ -f media/V1.mp4 ] && { [ ! -f media/keyframes/web/K1.jpg ] || [ media/V1.mp4 -nt media/keyframes/web/K1.jpg ]; }; then
  echo "slide 1  first frame of media/V1.mp4"
  ffmpeg -v error -y -i media/V1.mp4 -vf "select=eq(n\,0),scale=1920:-2" -frames:v 1 -q:v 2 media/keyframes/web/K1.jpg
fi
# slide 2 rests on the last frame of V1, so the video lands on it exactly
if [ -f media/V1.mp4 ] && [ ! -f media/keyframes/K2.png ] && { [ ! -f media/keyframes/web/K2.jpg ] || [ media/V1.mp4 -nt media/keyframes/web/K2.jpg ]; }; then
  echo "slide 2  last frame of media/V1.mp4"
  ffmpeg -v error -y -sseof -0.1 -i media/V1.mp4 -vf "scale=1920:-2" -update 1 -q:v 2 media/keyframes/web/K2.jpg
fi

mkdir -p assets/img
for f in reference/ref-0{2,3,4,6,7}-*.jpg; do
  [ -f "$f" ] || continue
  ffmpeg -v error -y -i "$f" -vf "scale='min(1600,iw)':-2" -q:v 4 "assets/img/$(basename "$f")"
done
echo "done"
