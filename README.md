<h1 align="center">
  <br>
  <img src="https://upload.wikimedia.org/wikipedia/commons/9/9d/Swift_logo.svg" alt="Swift Logo" width="120">
  <br>
  Fragments
  <br>
</h1>

<h4 align="center">An interactive, narrative-driven experience built for the <strong>WWDC Swift Student Challenge</strong>.</h4>

<p align="center">
  <a href="#about-the-project">About The Project</a> •
  <a href="#the-experience">The Experience</a> •
  <a href="#technical-architecture">Technical Architecture</a> •
  <a href="#how-to-run">How To Run</a> •
  <a href="#acknowledgements">Acknowledgements</a>
</p>

---

## 🎨 About The Project

**Fragments** is an experiential story built entirely in a Swift Playground. It challenges the user to step into an empty, pitch-black void, guided only by ambient sound and the voice of a narrator named Manav. 

As the story progresses, the user is prompted to draw "fragments" of memories—a pet, a table, a painting—using **PencilKit**. Piece by piece, the user's drawings populate the dark room, turning an empty canvas into a rich, personal environment. The climax culminates in the lights turning on, revealing the final composition before rolling the credits.

## 🌟 The Experience

1. **The Void:** The app opens in landscape mode, completely dark, accompanied by ambient meditative audio via `AVFoundation`.
2. **The Prompt:** The narrator introduces the scene. You are asked to imagine specific objects.
3. **The Canvas:** You are provided with a dedicated drawing area utilizing `PKCanvasView`. Let your creativity loose.
4. **The Reveal:** Your drawings are integrated directly into the environment. 
5. **The Climax:** The lights come on, triggering a dynamic SwiftUI animation scale effect, showing the beauty of your creation.

## 🛠 Technical Architecture

This project is built using native Apple frameworks, prioritizing a clean MVVM structure and utilizing SwiftUI's latest APIs.

- **SwiftUI Core:** Centralized declarative UI mapped dynamically via an `@EnvironmentObject`.
- **MVVM Design Pattern:** 
  - `GameViewModel.swift` controls the global state, the current story index, and holds the user's drawings.
  - `Game.swift` acts as a static JSON-like script repository for dialogue and scene triggers.
- **PencilKit Integration:** Custom `UIViewRepresentable` wrapper (`DrawingCanvas.swift`) seamlessly embeds the Apple Pencil layout into SwiftUI, exporting `UIImage` data on submission.
- **AVFoundation:** Singleton pattern used in `MusicPlayer.swift` for continuous background audio loop regardless of view lifecycle changes.
- **Custom Typography:** Manual loading of TTF files through `CTFontManagerRegisterGraphicsFont` inside `MyCustomFonts.swift` to ensure unique narrative feeling.
- **Custom Navigation:** Circumventing standard push behavior through a hidden `NavigationLink` wrapped inside `Navigation.swift`.

## 🚀 How To Run

1. Make sure you are using an iPad or Mac running **Xcode** or **Swift Playgrounds**.
2. Download or clone this repository.
3. Open `Fragments.swiftpm`.
4. Run the project in **Landscape** orientation for the intended experience.
5. Provide drawings when prompted, and proceed through the dialogue using the Next buttons.

## 📝 Future Improvements & Known Issues
- Currently, the navigation uses a recursive stack push which may consume increased memory (`OOM`) on continuous loops. Future updates plan to migrate to an `AppCoordinator` state switch model.
- Dynamic asset fallbacks to be implemented.

## 🤝 Acknowledgements

* Made specifically for Apple's WWDC Swift Student Challenge.
* Royalty-free ambient music: "Meditation" by Arulo (Mixkit).
* Custom Font: "Just Me Again Down Here" by Denis Masharov (Google Fonts).
* Special thanks to the Swift Club Parul University.

---
> Designed with ❤️ by Manav in India.
