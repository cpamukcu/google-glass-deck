# Google Flow — video V3 (slide 5 → slide 6, "the fix")

## Setup in Flow
- Mode: **Frames to Video**
- **First frame:** `media/keyframes/K5.png` (the glowing glass staircase)
- **Last frame:** `media/keyframes/K6.png` (two frosted diamonds, Glass in front)
- Length: 8 s, 16:9, 1080p if you can. Sound does not matter (the deck plays it muted).
- Make 2–4 versions and keep the smoothest one.

## Prompt (copy all of it)
> One smooth, slow cinematic camera move, no cuts. We start on a dark midnight-navy scene with a staircase of frosted glass steps outlined in thin cyan, violet and pink neon light, and a pair of smart glasses resting on the top step. The camera glides up the stairs toward the glasses. The glasses gently lift and float forward. The steps soften into light, and their glowing edges fold and turn into two large frosted glass diamond panels, one with a cyan glow and one with a pink glow, standing side by side on a dark glass pedestal. The glasses settle in front of the two diamonds, and the camera comes to rest. Floating light dust, soft depth of field, premium Apple-keynote look, calm and clean. Keep the left side of the frame dark and empty. No people, no text, no logos, no letters.

## If it does not work well
- **Morph looks messy:** remove the sentence about the steps folding and write: *"Light sweeps across the frame and the scene dissolves smoothly into two frosted glass diamond panels…"*
- **Glasses change shape:** add *"The smart glasses keep exactly the same shape and colour the whole time."*
- **No "last frame" option in your plan:** use K5 as the first frame only. The deck fades softly into K6 at the end anyway.

## After you download it
1. Rename it to **`V3.mp4`** and put it in `media/`.
2. Double-click `make-reverse.sh` (or run it in Terminal). It makes `V3_rev.mp4` for the Back button.
3. Refresh the deck. Slide 5 → 6 now plays the video. Nothing else to change.
