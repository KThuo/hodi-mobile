# Framing the metre reading

## The complaint

> the ocr image capture, show me where to place the metre reading so that the correct numbers are
> captured. right now where we are reading and what we are capturing are different.

## What was actually happening

There was no frame, and there was no crop. `ImageHelper.captureFromCamera()` opened the system
camera, handed back the whole photograph, and `OcrHelper.recognizeText()` ran the recogniser over
all of it. `extractReading()` then picked, out of every number anywhere in the frame, the one with
the most digits.

On a metre, the longest run of digits is frequently not the reading. It is the serial number
etched on the faceplate beside the dials, or the model number, or the certification year. So the
app would return a confident, plausible, wrong number — and there was nothing on screen telling
anybody where to aim, because aiming made no difference.

## The fix

Framing is the mechanism, not advice.

1. The system camera still takes the photograph, whole. That photograph is the *evidence* and is
   what gets attached to the reading — the whole metre, its number, where it is.
2. `ReadingFrameScreen` then shows that photograph under a fixed, dimmed-out band shaped like the
   thing being read: wide, shallow, cornered in the brand colour. The person pinches and drags the
   photograph until only the dials sit inside it.
3. `ImageCrop.sourceUnder()` inverts the viewer's transform to find which source pixels are under
   the band, and `ImageCrop.toPngFile()` cuts exactly those out at 3× and writes them to temp.
4. The recogniser is given that strip and nothing else. The crop is deleted straight after.

So "line the dials up in the frame" is literally true: the pixels inside the rectangle are the
only pixels the recogniser ever sees.

### Why the image moves and the frame does not

A draggable frame has to be aimed twice — once with the camera, once with a fingertip, on a
rectangle the finger is covering. Pinch-and-drag under a fixed band is the gesture every photo
viewer on the handset already uses, and it keeps the target in the one part of the screen that is
never under a hand.

### Why PNG at 3×

The band of dials is a small part of a photograph, and recognition on a forty-pixel-tall strip is
markedly worse than on the same strip enlarged — the enlargement invents no detail but gives the
recogniser the glyph heights it was tuned for. PNG because JPEG ringing around high-contrast
digits is exactly the artefact that turns an 8 into a 3, and the file is a strip, so there is
nothing to save by compressing it.

### Skipping

Framing is offered, not compelled. Backing out keeps the photograph and leaves the reading to be
typed, which is what somebody does when the light is bad anyway.

## Where it lives

| File | Part |
| --- | --- |
| `lib/core/utils/image_crop.dart` | `sourceUnder()` mapping, `toPngFile()` crop |
| `lib/features/metres/presentation/widgets/reading_frame_screen.dart` | The band, the gesture |
| `lib/features/metres/presentation/widgets/update_reading_sheet.dart` | Capture → frame → read |
| `test/core/utils/image_crop_test.dart` | The mapping, under translation and scale |

The mapping is the only part that can be wrong quietly: a bad rectangle still produces a picture,
still runs the recogniser, and still returns a number — just the wrong one again. Hence the tests.
