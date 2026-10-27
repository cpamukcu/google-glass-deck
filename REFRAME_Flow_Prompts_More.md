# More Flow videos — same look as video 1 (real photo, grey studio, one slow camera move)

Video 1 look: photoreal close-up, soft grey studio background, real person wearing white Glass, slow turn from side view to front view, shallow depth of field, calm and clean.

## Shared style line (add to every prompt)
> Photorealistic, shot on a cinema camera, soft grey studio background, soft natural light, shallow depth of field, one slow smooth camera move, no cuts, no text, no logos, calm and clean, 16:9, 8 seconds. The first frame must match the start image exactly.

## V2 — S3 → S4 "It worked for one person. Not for the room."
Start frame: close-up of the wearer's eye and Glass (your ref-03 photo).
> The camera slowly pulls back from the close-up of the man's eye and white smart glasses. The grey studio background softly turns into a quiet cafe. Several people at nearby tables look up and glance toward him, a little unsure and curious. The man stays calm and focused on his own task. Soft light, smooth pull-back. [Shared style line]

## V3 — S5 → S6 "The fix: same tech, new problem, new room"
Start frame: dark/quiet moment, or the Glass close-up on grey.
> A worker in a warehouse puts on the same white smart glasses. A small clear light on the frame glows, so everyone nearby can see it is recording. A colleague looks at him and nods, relaxed and comfortable. The camera slowly glides from a side view to a front view. Bright, hopeful, clean light. [Shared style line]

## V4 — S6 → S7 "Who is in the room?" (closing)
Start frame: the worker with the Glass, from V3's last frame.
> The camera slowly pulls back and rises. The warehouse fades into a calm, empty room with soft light falling on the floor. A pair of white smart glasses rests alone on a simple table in that light. Quiet and peaceful. [Shared style line]


## HOW TO SET UP EACH CLIP IN FLOW (Frames to Video)
- **Start frame** = the last frame of the clip before it (or the slide image K, for the first clip).
- **End frame** = the image of the slide you go to.
- Prompt = the move. Always add: "The first and last frame must match the given images exactly."
- Get the last frame: play the clip in Flow, pause at the very end, save the frame (or use Flow's extend option).

| Clip | Slides | Start frame | End frame |
|---|---|---|---|
| V1 (done) | 1 → 2 | K1 | K2 |
| V2 | 3 → 4 | K3 (eye close-up, ref-03) | K4 |
| V3 | 5 → 6 | K5 | K6 |
| V4 | 6 → 7 | last frame of V3 (= K6) | K7 |

- K images = the 7 slide pictures made in Yuanbao (same grey-studio photoreal look as V1).
- If a clip's last frame is a little different from the next K image, the deck cross-fades the last second. No problem.
- Short on time? Make only V2 and V3. Use cross-fades for the rest.
- Photo names in Downloads: ref-01 … ref-08 (ref-01, 05, 08 = style only).

## Tips
- Make 2–3 versions of each. Keep the one with the smoothest motion and the least face change.
- Rename to `V2.mp4`, `V3.mp4`, `V4.mp4` and put them in `REFRAME_Glass_Deck/media/`.
- Your video 1 is the opening. Rename it `V1.mp4`.
