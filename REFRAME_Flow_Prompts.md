# VISUAL PROMPTS — 2 Flow videos + 7 Yuanbao images (Google Glass pitch)

## The plan in one view
- **7 background images K1–K7** → made in **Yuanbao** (image-to-image, using your real photos).
- **2 videos** → made in **Google Flow** (Frames to Video):
  - **VA = K1 → K2** (opening)
  - **VB = K5 → K6** (the fix moment)
- All other slide changes = soft cross-fade made by the deck code.
- Order of work: 1) make K1–K7 in Yuanbao → 2) pick the best → 3) use K1+K2 and K5+K6 in Flow → 4) save files → 5) Claude Code builds the deck.

Why this is seamless: the video starts on the exact same image as the slide before, and ends on the exact same image as the next slide.

## Style block (add to EVERY prompt)
> Dark midnight-navy background, frosted liquid-glass surfaces with a soft beige-white tint, thin glowing edges in cyan and violet with a little pink, soft depth of field, floating light dust, premium Apple-keynote look, clean and minimal, 16:9, large calm empty dark area on the LEFT side for text, no text, no logos, no letters.

## Your photos (in `reference/`)
| Photo | Used for |
|---|---|
| ref-07-glass-white-side | K1 (hero), K6 |
| ref-04-glass-three-colours | K2 |
| ref-03-glass-eye-white | K3 |
| ref-06-glass-prism-hold | K4 |
| ref-02-glass-hand-closeup | K5 (optional) |
| ref-01, ref-05, ref-08 | STYLE only — upload as "style reference" |

## Yuanbao tips
- Upload the real photo + the style reference, then paste the prompt.
- Say it every time: **"Keep the real product exactly the same shape, color and details. Only change the background and lighting."** AI likes to redesign the glasses — reject any result where the shape changed.
- Ask for 4 versions, pick the best. Ratio 16:9. If the result is square, say "extend the background to 16:9".
- Do not let it add text, logos or faces. If it adds any, say "remove the text/face, keep everything else".
- Real people's faces in your photos (ref-03, ref-06): crop to the eye/glasses area before upload, or keep the face blurry in the dark. Do not make a new face.

---

## K1 — Title (use ref-07)
> Take this real photo of white smart glasses. Keep the glasses exactly the same shape and color. Place them floating on the right side of a dark midnight-navy glass world, lit with soft cyan and violet rim light, faint reflection on a glossy dark glass floor. Empty calm dark space on the left. [Style block]

## K2 — Timeline (use ref-04)
> Take this real photo of three colored smart glasses. Keep them exactly the same. Place them small on the right, floating above a long thin horizontal line of glowing light across a dark frosted-glass surface. Four small glowing glass beads sit on the line. Left side calm and dark. [Style block]

## K3 — "Nobody asked for it" (use ref-03)
> Take this real close-up photo of a person wearing smart glasses. Keep the glasses exactly the same. Put the image inside the right half of a dark glass room, with a large glowing frosted-glass question mark floating next to it, and a small empty glass speech bubble with no glow. Left side calm and dark. [Style block]

## K4 — "One person, not the room" (use ref-06)
> Take this real photo of a hand holding smart glasses close to the camera. Keep the glasses exactly the same. Place it on the right, in front of a dark glass floor where a wide circle of many small dim glass spheres all face one bright glowing cyan sphere (like many people looking at one person). Soft ripples on the floor. Left side calm. [Style block]

## K5 — "It skipped the listening step" (use ref-02, optional)
> A staircase of frosted-glass steps rising to the right. The three bottom steps are dark, cracked and unlit. Only the top step glows. A small smart-glasses shape rests on the top step (use this real photo, keep it exactly the same). Left side calm and dark. [Style block]

## K6 — The fix (use ref-07 small)
> Two connected diamond shapes made of frosted glass, side by side. The left diamond glows cyan, the right glows violet-pink. Thin light lines run through both. A small copy of these real white smart glasses (keep exactly the same) floats inside the right diamond. Floating above a dark glass floor, centered, empty space above for text. [Style block]

## K7 — Closing
> A calm empty dark room with glass walls. One soft warm-white light from above on the floor in the center. A glass silhouette of smart glasses rests in the light. Very quiet, lots of dark space. [Style block]

---

## Flow videos (only 2) — Frames to Video
Settings: Veo best quality, 16:9, 1080p, **8 s**, no audio. Make 2–3 versions, pick the smoothest. Camera: slow, one direction, no cuts, no shake.
Start frame = first image. End frame = second image. Add this line to both prompts: **"The first and last frame must match the given images exactly."**

### VA — K1 → K2 (opening: "glass becomes timeline")
> Slow smooth camera pull-back and slide to the left. The white smart glasses dissolve into a stream of glowing light particles that flow to the right and line up into a thin horizontal line of light. The three colored glasses and four glass beads appear along the line one by one. One continuous move, no cuts. [Style block]

### VB — K5 → K6 (the fix: "broken steps become the new plan")
> The staircase of dark cracked glass steps melts into liquid glass, then re-forms into two connected glowing diamonds, cyan on the left, violet-pink on the right. The camera glides forward and settles in the center. The dark cracked light turns into clean bright light. A small pair of white smart glasses floats up into the right diamond. Hopeful, smooth, one continuous move. [Style block]

### Key moments to check
| Clip | Last frame must show | Must NOT show |
|---|---|---|
| VA | Timeline line + beads + small glasses | The big hero glasses |
| VB | Two diamonds + small glasses inside | Stairs |

If a clip drifts from the end image, run it again with a shorter prompt. Or cut the clip 1 s early; the deck then cross-fades the last second.

## Save these files → `REFRAME_Glass_Deck/media/`
- Images: `K1.png … K7.png` (put in `media/keyframes/`)
- Videos: `VA.mp4`, `VB.mp4`
Then tell Claude Code: "Media is in media/. Make reverse files and test the deck."

## If you run low on time
- Skip videos completely. 7 images + cross-fade still looks good.
- Make VB first (the fix moment is the best one to show).
