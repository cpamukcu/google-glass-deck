Work in ~/Desktop/REFRAME_Glass_Deck/. Build my 7-slide HTML pitch deck for my Design Thinking class (ZJU, Google Glass: why it failed, how to bring it back). I present ALONE on my MacBook, 7 minutes max, with my phone as remote.

FIRST read these files (do not print long output, no base64):
1. REFRAME_Claude_Code_Prompt.md — the full spec (slide text, language rules, remote, notes, tests). Follow it.
2. index.html, remote.html, presenter.html, present-server.js, Start Presenting.command — an older scaffold. Reuse it, change only what is needed.
3. reference/ — my real Glass photos (ref-01…08). ref-01, 05, 08 are style only.

OVERRIDES (these beat the spec file where they differ):

A. Presenter = Can Pamukcu (individual). No team name on slides. Title footer: "Can Pamukcu · Design Thinking · ZJU · 27 Oct 2026".

B. Backgrounds and transitions. I have 4 real videos made in Google Flow, photoreal, grey studio look. They will be in media/:
   - V1.mp4  slide 1 → 2
   - V2.mp4  slide 3 → 4
   - V3.mp4  slide 5 → 6
   - V4.mp4  slide 6 → 7
   Other moves (2→3 and 4→5) = soft 0.9 s cross-fade with a slow zoom 1.00→1.04.
   Resting background of each slide = still image media/keyframes/K1.png … K7.png (made in Yuanbao). K(i) must equal the first frame of the video that leaves slide i and the last frame of the video that arrives at slide i. If a file is missing: use the real photos from reference/ on a dark gradient; the deck must never break.
   - Play videos full screen, muted, `playsinline`. Two stacked layers, no black flash. Preload all.
   - Text of the old slide fades out in the first 0.5 s. Text of the new slide fades in during the last 1.2 s (`timeupdate`).
   - Back button plays the same move in reverse. Make files with ffmpeg in make-reverse.sh: `ffmpeg -i V1.mp4 -vf reverse -an V1_rev.mp4` (all four). No playbackRate = -1.
   - Clicks during a move are ignored (or queued once). One API only: goTo(i), next(), prev(). Keyboard, click, touch and phone remote all call it.
   - Keys: → Space = next, ← = back, F = full screen, H = hide QR, B = black, N = notes. URL hash #0…#6.

C. Look: dark neon glass UI over the photoreal backgrounds. Put a soft dark gradient scrim on the left 50% so text is always easy to read. Frosted beige-white glass cards, thin cyan/violet glow edges, Inter font, big title, very little text, Apple-keynote feel. Copy the glass style of reference/ref-01 and ref-05. Do not put ref-01/05/08 on slides.

D. Speaker notes: per slide give `line` (one sentence to start), `say` (3–4 short bullets), `if_asked` (one backup fact), `time` (seconds). Simple spoken English, B1/B2. Show line + say big on the phone.

E. Phone remote: main way = local Wi-Fi server (present-server.js, no internet needed), QR + 4-digit code on the deck, hides after pairing. Backup = PeerJS (may be blocked in China — say so in README). Phone page: huge Back/Next, slide number, title, notes, timer (orange at 6:00, red at 7:00), wake lock, auto-reconnect.

F. Also make: GoogleGlass_CanPamukcu.pdf (static export, one page per slide, using K images as background), Start Presenting.command (chmod +x), README.txt (3 steps to present + what to do if the phone does not connect: phone hotspot, USB clicker, arrow keys).

G. Language in slides: very simple English, max 15 words per slide, no academic or AI words, no new numbers or facts. Thinker names only as tiny grey tags at the bottom.

TEST before you say done: deck in Chrome and Safari; remote on my real phone (next, back, notes, reconnect after refresh); all forward and back moves; no media = still works; 1280×720 and 1920×1080. Never say the remote works unless you tested it on a real device. If something fails, say it plainly.

Final answer: short, plain English: what you built, how to start (3 steps), what is not tested yet.
