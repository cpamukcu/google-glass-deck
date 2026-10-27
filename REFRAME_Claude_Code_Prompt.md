# CLAUDE CODE PROMPT — REFRAME Google Glass Deck (HTML, phone remote)

Paste this whole file into Claude Code. Work inside `~/Desktop/REFRAME_Glass_Deck/`.

## 0. Read first (do not rewrite what works)
- `index.html`, `remote.html`, `presenter.html`, `present-server.js`, `Start Presenting.command` already exist. Read them first. Reuse them. Only change what is needed.
- Do not print base64 or long files in the chat. Keep answers short.
- Reference style: https://cpamukcu.github.io/ai-bridge/ and https://cpamukcu.github.io/honyar-turkey/ — one full-screen page per slide, a background video behind it, smooth video transition between slides, very little text, Apple-tech feel.

## 1. Goal
A 7-slide pitch deck for my Design Thinking class (ZJU). This is my INDIVIDUAL task. Presenter: **Can Pamukcu**. Pitch: **7 minutes max**. Presenting on my MacBook. Due 27 Oct, noon. File name for upload: `GoogleGlass_CanPamukcu` (change if the brief says otherwise).
The deck answers two questions:
1. Why did Google Glass fail?
2. How could Google bring it back?

## 2. Language rules (very important)
- Plain, simple English. Level B1/B2. Short sentences. Everyday words.
- No AI talk. No academic talk. No words like "paradigm", "leverage", "stakeholder", "holistic", "ontology", "sensemaking".
- Max 15 words per slide (title not counted). One idea per slide.
- Do not add any number or fact that is not in this file.
- Thinker names (Norman, Heufler, Rams...) appear ONLY as small grey "tag" chips at the bottom of a slide. Never as a long sentence. The speaker says the idea in simple words.

## 3. Look
- Dark navy/black background. Frosted glass cards (beige-white tint, blur, thin light border). Soft neon glow (cyan + violet + a little pink) on edges only.
- Style comes from `reference/ref-01-liquid-glass-ui-kit.jpg` and `ref-05-glass-settings-panels.jpg` (glass panels, glow, rounded corners). Use `ref-08-google-ai-mode-bar.jpg` for the "glow line" feeling.
- Font: Inter (or system SF). Big title 64–80px, body 28–32px, tag chips 14px. Lots of empty space.
- 16:9, scales to any screen. Test at 1920×1080 and 1280×720.
- Background of each slide = the matching video in `media/` (see section 6). Poster image = same keyframe `media/keyframes/K#.png` so there is never a black flash.

## 4. Photos I give you (in `reference/`)
| File | Use |
|---|---|
| ref-02-glass-hand-closeup.jpg | Slide 2 (launch moment), small glass card |
| ref-03-glass-eye-white.jpg | Slide 3 (the wearer) |
| ref-04-glass-three-colours.jpg | Slide 1 hero or Slide 2 (looked like a fashion product) |
| ref-06-glass-prism-hold.jpg | Slide 4 (the small camera/lens people stare at) |
| ref-07-glass-white-side.jpg | Slide 1 or Slide 6 (clean product shape) |
| ref-01, ref-05, ref-08 | STYLE ONLY. Do not put these on slides. |
- Put each photo inside a rounded frosted-glass frame, with a soft shadow. Never stretch. `object-fit: cover`.
- Add one tiny footer on slides with photos: "Photos: press images".
- Copy used photos to `assets/img/` and compress (max 1600px wide, JPG 80%).

## 5. Slides (exact content)

**S1 — Title**
- Title: **Google Glass: a great answer to the wrong question**
- Sub: Why it failed. How to bring it back.
- Footer: Can Pamukcu · Design Thinking · ZJU · 27 Oct 2026
- Photo: ref-07 (large, right side)
- Speaker time: 0:30

**S2 — Timeline: "Great tech. Bad reaction."**
- 4 glowing points on one line:
  - 2012 — Big launch
  - 2013 — Test version, $1,500
  - 2014 — People say "Glasshole"
  - Jan 2015 — Google stops selling it
- Photo: ref-04 or ref-02 (small)
- Speaker time: 0:50

**S3 — Why it failed #1: "Nobody asked for it."**
- Big text: Google asked: "Can we put a computer on your face?"
- Small text: Nobody asked: "What do people need?"
- Tags: Norman · Griffin
- Photo: ref-03
- Speaker time: 1:10

**S4 — Why it failed #2: "It worked for one person. Not for the room."**
- Two glass cards side by side:
  - Left card "The wearer": hands free, happy.
  - Right card "Everyone around": watched, not sure if it records.
- Tags: Heufler · Rams · Papanek
- Photo: ref-06
- Speaker time: 1:20

**S5 — Why it failed #3: "It skipped the listening step."**
- Three short lines that appear one by one:
  - No clear problem written down.
  - No tests in real places.
  - Made for "everyone".
- Tags: Design Ladder · Becker · Ulrich
- Speaker time: 0:50

**S6 — The fix: "Same tech. New problem. New room."**
- 4 steps in a glass row, with arrows (one by one):
  1. **Listen** — to the wearer AND the people around.
  2. **Choose the problem** — "How can we give hands-free help, without making others feel watched?"
  3. **Build** — a clear recording light. Start with workers: repair, warehouse, surgery.
  4. **Test** — in real places, then improve.
- Tags: Norman (Double Diamond) · Micheli
- Speaker time: 1:50

**S7 — Closing**
- One line, centered: **Before you ask what it does, ask: who is in the room?**
- Small: Glass forgot the room. The room said no.
- Footer: Thank you
- Keep this slide open during questions.
- Speaker time: 0:30

Total = 7:00. Add a visible-on-phone timer (see section 7).

## 6. Backgrounds: 2 videos + 5 images (seamless feel)
Only 2 moments are real video (made in Google Flow). All other slides use still images I make in Yuanbao from my real photos. Files arrive in `media/`:
- `K1.png … K7.png` — 7 background images (one per slide). Put in `media/keyframes/`.
- `VA.mp4` — video **S1 → S2** (opening, 6–8 s, 1080p, no sound). Starts on K1, ends on K2.
- `VB.mp4` — video **S5 → S6** (the fix moment, 6–8 s). Starts on K5, ends on K6.
- All other changes (S2→S3, S3→S4, S4→S5, S6→S7) = **soft cross-fade between K images**, 0.9 s, with a slow zoom (scale 1.00 → 1.04) and a blur-to-sharp feel so it still looks smooth.

Behaviour:
1. Slide i shows image Ki as background (fixed, `object-fit: cover`).
2. On Next from S1 or S5: play the video full screen, then show next slide. Text of old slide fades out in the first 0.5 s. Text of new slide fades in during the last 1.2 s of the clip (`timeupdate`).
3. On Next for all other slides: cross-fade as above (use two stacked layers, no black flash).
4. On Back: for S2→S1 and S6→S5 play the SAME clip in reverse. Make reverse files with ffmpeg in `make-reverse.sh`: `ffmpeg -i VA.mp4 -vf reverse -an VA_rev.mp4` (same for VB). No `playbackRate = -1`. Other Back moves = reverse cross-fade.
5. Preload both videos and all 7 images.
6. If a video file is missing, use the cross-fade for that move. The deck must always work with images only, or with nothing (dark gradient).
7. Clicks during a transition are ignored (or queued once).
8. Keys: → / Space / PageDown = next. ← / PageUp = back. `F` = full screen. `H` = hide QR. `B` = black screen. `N` = notes.
9. One navigation API only: `goTo(i)`, `next()`, `prev()`. Keyboard, click, touch and remote ALL call these. No copied transition logic.
10. URL hash works: `#0 … #6` (like AI Bridge).

## 7. Phone remote control (must work in class)
Class Wi-Fi in China can block public servers. So build TWO ways:

**Way A (main): local server, no internet needed.**
- Use/extend `present-server.js` (Node, WebSocket). `Start Presenting.command` starts it and opens the deck full screen.
- The server prints and shows on the deck: a QR code + 4-digit code, in a corner. The QR opens `http://<computer-LAN-IP>:PORT/remote.html?code=XXXX` on the phone. Phone and computer must be on the same Wi-Fi (or the computer's phone hotspot).
- Hide QR after pairing, and when `H` is pressed.

**Way B (backup): PeerJS (WebRTC)** — only if Way A cannot connect. Load PeerJS from a CDN. Tell me this can be blocked in China.

**Phone page (`remote.html`)** — mobile first, dark, portrait:
- Two huge buttons: **Back** and **Next**. Small: first slide, black screen.
- Shows: slide number (3 / 7), slide title, **speaker notes in large text**, and a **timer** (starts at first Next, turns orange at 6:00, red at 7:00).
- Keeps screen awake (`navigator.wakeLock`). Reconnects by itself after a refresh or Wi-Fi drop.
- Messages (JSON): phone → deck `{cmd:'next'|'prev'|'goto', n}`; deck → phone `{slide, total, title, notes}` after every change.
- Remote calls ONLY `next()/prev()/goTo()`. Back plays the same reverse transition as ←.

**Speaker notes**: put them in a `notes` array in `index.html`, one entry per slide. Format = bullet points, with more support, written in simple spoken English (B1/B2). For each slide give:
- `say` — 3 to 4 short bullets (the main points, in the order I say them).
- `line` — one exact sentence to open the slide (so I never get stuck).
- `if_asked` — one short backup fact or example, in case the teacher asks.
- `time` — target seconds for this slide.
Show `line` + `say` large on the phone. `if_asked` is smaller, below. No names of speakers (I present alone).

## 8. Also deliver
1. `GoogleGlass_CanPamukcu.pdf` — static export of all 7 slides (Playwright or Chrome headless, keyframe as background). This is the file I upload to Learning at ZJU, because the class site may not accept HTML. Also keep a `.pptx` only if I ask.
2. `Start Presenting.command` double-click works on macOS (chmod +x).
3. A one-page `README.txt`: how to present in 3 steps, and what to do if the phone does not connect.

## 9. Test before you say "done"
- Test on my MacBook in Chrome and Safari. Provide the HDMI/full-screen tips in README.
- Open the deck. Open `remote.html` on a second tab AND on my real phone. Test next, back, notes, reconnect after refresh, `H` key.
- Test all 6 forward and 6 back moves, including the 2 real videos and their reverse: no black flash, text fades in time.
- Test with no videos in `media/` (fallback cross-fade) and with images only.
- Test at 1280×720 and 1920×1080.
- Check every slide for text over 15 words and for hard words from section 2.
- Never say the remote works until you tested it on a real device. If something fails, say it plainly and give the fallback: phone hotspot for the computer, a USB clicker, or arrow keys.

## 10. Final answer format
Short. Plain English. Tell me: what you built, how to start it (3 steps), what is not tested yet.
