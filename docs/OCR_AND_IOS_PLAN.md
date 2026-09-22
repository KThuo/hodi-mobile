# Reading a meter: aim the camera, not the photograph

**22 September 2026.**

---

## 1. Parked: iOS is configured and unverified

`google_mlkit_text_recognition` declares `s.ios.deployment_target = '15.5'` and pulls
`GoogleMLKit/TextRecognition ~> 7.0.0`. It is the only dependency in the app asking for more than
13.0 — everything else, webview included, stops there. So OCR alone sets the iOS floor.

Done in `8ce7221`, **none of it verified**:

- `IPHONEOS_DEPLOYMENT_TARGET` 13.0 → 15.5, all three configurations.
- `ios/Podfile` added — Flutter's own template with `platform :ios, '15.5'`. There was none, which
  means iOS has never been built in this repository.
- The plist needed nothing: capture is camera-only and `NSCameraUsageDescription` and
  `NSFaceIDUsageDescription` are both present.

**Blocked on tooling.** This machine has Command Line Tools rather than a full Xcode, and no
CocoaPods, so `pod install` and `flutter build ios` cannot run. To finish:

```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcodebuild -runFirstLaunch
brew install cocoapods
flutter build ios --no-codesign
```

Two things that build is expected to answer:

- **The arm64 simulator.** ML Kit historically shipped no arm64 slice for the iOS simulator, so an
  Apple Silicon Mac needed `EXCLUDED_ARCHS` or a real device. Whether 7.x still does is unknown.
- **Size.** The ML Kit pods are large, and iOS has no per-ABI split to hide it behind.

**And a product decision still open:** 15.5 drops the iPhone 6s and the first SE. If that is not
acceptable, the alternative is Apple's `Vision` framework on iOS behind the existing `OcrHelper`
interface, keeping ML Kit for Android. `OcrHelper` has exactly one caller, so the seam is already in
the right place.

---

## 2. The guide belongs on the camera

### 2.1 What happens now

Three steps: the system camera takes a photograph, `ReadingFrameScreen` shows it under a fixed band
which the person pinches and drags the photograph beneath, and the pixels under the band go to the
recogniser.

The band is doing real work and its reasoning holds — the longest run of digits on a meter is very
often the serial number, not the reading, so cropping before recognition is the mechanism rather
than advice. That does not change.

**What is wrong is when it is shown.** Nothing guides the person while they are pointing the phone,
so the framing is done afterwards, to a photograph that may not contain a usable shot of the dials
at all. `axis-m` does the opposite for barcodes: `ScanScreen` puts a bordered window over the live
preview, so the aiming happens once, with the camera.

### 2.2 What we build

A `ReadingCameraScreen`: live preview, the same band drawn over it, a shutter and a torch.

- **The band is the same shape** — `width * 0.86`, `width / 3.4` capped at `height * 0.45`, centred.
  Wide and shallow, shaped like the row of dials, which is most of what tells somebody what to put
  in it. Lifted into one place so the live overlay and the adjust screen cannot drift apart.
- **The crop is taken from the band** without anybody dragging anything: the band's position as a
  fraction of the preview maps onto the captured image, and `ImageCrop.toPngFile` does the rest at
  3× exactly as now.
- **A torch**, because meters live in stairwells and car parks. This is the addition most likely to
  change whether a reading is recognised at all, and it is two lines against the camera controller.

### 2.3 What happens to the adjust screen

`ReadingFrameScreen` stays, demoted to a fallback: offered when the recogniser finds nothing in the
band. Aiming at a meter in bad light is fiddly enough that "take it again" is a worse answer than
"move the photograph a little", and the screen already exists and works.

So the common path loses a step — aim, shoot, done — and the awkward path keeps the tool it needs.

### 2.4 The cost

One dependency in, one out. `camera` is a first-party plugin and is on both platforms.

**`image_picker` goes**, which I did not expect when writing this: the meter path turned out to be
its only caller, so `ImageHelper` and the package with it were dead the moment the viewfinder
replaced `captureFromCamera`. Nothing else in the app picks or captures an image.

---

## 3. Not doing

- **No live recognition.** Running the recogniser on every preview frame is how a scanner works
  because a barcode either decodes or does not. A meter reading has no checksum: a recogniser fed
  sixty frames a second produces sixty candidate numbers with nothing to choose between them, and
  picking one silently is worse than reading the one frame somebody chose.
- **No change to `extractReading`.** It picks the longest digit run at or above the previous
  reading, and that stays the rule.
