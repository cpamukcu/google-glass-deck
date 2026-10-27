#!/bin/bash
# Starts the Google Glass presentation from this Mac. No internet needed.
# 1. Join your phone's personal hotspot first (for the phone remote).
# 2. Double-click this file. Chrome opens full screen on slide 1.
# 3. Scan the QR code in the corner of slide 1 with your phone camera. It hides once the phone is paired.
# Keep the Terminal window open while you present (it also stops the Mac from sleeping).
DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$DIR" || exit 1
NODE=$(command -v node || echo /usr/local/bin/node)
# A VPN can block the phone from reaching this Mac. Warn (do not change anything).
if command -v mullvad >/dev/null && mullvad lan get 2>/dev/null | grep -q block; then
  echo ""
  echo "  !! Mullvad VPN is blocking your phone. Fix it with ONE of these, then scan again:"
  echo "     - Mullvad app > Settings > VPN settings > Local network sharing: ON"
  echo "     - or disconnect Mullvad while you present"
  echo ""
fi
if pgrep -qf iKuuuVPN; then echo "  !! iKuuuVPN is running. If the phone cannot connect, quit it while you present."; fi
pkill -f "present-server.js" 2>/dev/null; sleep 0.5
caffeinate -dims "$NODE" present-server.js &
SERVER=$!
for i in $(seq 1 40); do curl -s -o /dev/null http://127.0.0.1:8000/ && break; sleep 0.25; done
IP=""; for IF in en0 en1 en2 en3 en4 bridge100; do IP=$(ipconfig getifaddr "$IF" 2>/dev/null); [ -n "$IP" ] && break; done
if [ -z "$IP" ]; then echo "  !! Not on any network. Slides work; the phone remote needs your hotspot."; HOST=localhost; else HOST=$IP; fi
if [ -d "/Applications/Google Chrome.app" ]; then
  open -na "Google Chrome" --args --user-data-dir="$DIR/.chrome-profile" --no-first-run --no-default-browser-check \
    --start-fullscreen --autoplay-policy=no-user-gesture-required "http://$HOST:8000/#0"
else
  open "http://$HOST:8000/#0"
fi
echo "  Presenter view (only if your laptop screen is NOT mirrored): http://localhost:8000/presenter"
wait $SERVER
