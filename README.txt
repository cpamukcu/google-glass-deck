GOOGLE GLASS DECK · Can Pamukcu · Design Thinking · ZJU
=======================================================

PRESENT IN 3 STEPS
1. Turn on your phone's Personal Hotspot and join it with the MacBook.
   (Class Wi-Fi often blocks phone-to-laptop traffic. The hotspot never does, and no internet is needed.)
2. Double-click "Start Presenting.command". Chrome opens the deck full screen on slide 1.
   Keep the Terminal window open (it also keeps the Mac awake).
3. Scan the QR code in the bottom-right corner of slide 1 with your phone CAMERA (not WeChat).
   The page opens with your 4-digit code. The QR hides by itself once the phone is paired.

KEYS ON THE LAPTOP
  →  Space        next          ←          back
  F               full screen   H          show / hide the QR
  B               black screen  N          speaker notes (only use if the screen is NOT mirrored)
  #0 … #6 in the address bar jumps to a slide.

PHONE PAGE
  Big Back / Next buttons, slide number, title, your notes (first line + bullets + "If asked").
  Timer starts at the first Next. Orange at 6:00, red at 7:00. Tap the timer to reset it.
  Screen stays on. If Wi-Fi drops or you refresh, it reconnects by itself.

IF THE PHONE DOES NOT CONNECT
  a) Check the phone and the Mac are on the SAME network (best: the phone's hotspot).
  b) Restart: close Terminal, double-click "Start Presenting.command" again, scan the NEW QR
     (the code changes every start).
  c) Still no luck: use the arrow keys or a USB / Bluetooth clicker (they send arrow keys).
     The deck works fully without the phone.
  d) Backup way (PeerJS over the internet): only if remote.html is hosted online and
     BACKUP_REMOTE is set in index.html. PeerJS servers are often blocked in China, so do not count on it.

FILES
  index.html               the deck (7 slides, notes are in the NOTES list at the top of the script)
  remote.html              phone remote          presenter.html   laptop presenter view (non-mirrored only)
  present-server.js        local server, no internet, no npm install
  make-reverse.sh          run after you change media: reverse clips, light JPG backgrounds, photos
  GoogleGlass_CanPamukcu.pdf   static copy to upload to Learning at ZJU
  media/V1.mp4, V3.mp4     the two videos: slide 1 → 2 and slide 5 → 6. All other moves are a soft cross-fade.
  media/keyframes/         slide backgrounds (slides 1 and 2 use the first and last frame of V1)
  media/V2.mp4, media/unsorted/   extra clips, NOT used now. To use V2 later, add 2:'V2' to VIDEOS in index.html.

REMAKE THE PDF (after changing slides)
  Double-click or run make-pdf.sh. It saves each slide as a sharp picture, so the PDF looks the same
  in Preview, Acrobat, WeChat and the course site. (Text in the PDF is not selectable.)
