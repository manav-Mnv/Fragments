<h1 align="center">
  <br>
  <img src="https://upload.wikimedia.org/wikipedia/commons/9/9d/Swift_logo.svg" alt="Swift Logo" width="120">
  <br>
  Fragments
  <br>
</h1>

<h4 align="center">An interactive, narrative-driven experience built for the <strong>WWDC Swift Student Challenge</strong>.</h4>

<div align="center">

[About The Project](#about-the-project) • [The Experience](#the-experience) • [Technical Architecture](#technical-architecture) • [App Audit & Analysis](#app-audit--analysis) • [How To Run](#how-to-run) • [Acknowledgements](#acknowledgements)

</div>

---

## About The Project

**Fragments** is an experiential story built entirely in a Swift Playground. It challenges the user to step into an empty, pitch-black void, guided only by ambient sound and the voice of a narrator named Manav. 

As the story progresses, the user is prompted to draw "fragments" of memories—a pet, a table, a painting—using **PencilKit**. Piece by piece, the user's drawings populate the dark room, turning an empty canvas into a rich, personal environment. The climax culminates in the lights turning on, revealing the final composition before rolling the credits.

## The Experience

1. **The Void:** The app opens in landscape mode, completely dark, accompanied by ambient meditative audio via `AVFoundation`.
2. **The Prompt:** The narrator introduces the scene. You are asked to imagine specific objects.
3. **The Canvas:** You are provided with a dedicated drawing area utilizing `PKCanvasView`. Let your creativity loose.
4. **The Reveal:** Your drawings are integrated directly into the environment. 
5. **The Climax:** The lights come on, triggering a dynamic SwiftUI animation scale effect, showing the beauty of your creation.

## Technical Architecture

This project is built using native Apple frameworks, prioritizing a clean MVVM structure and utilizing SwiftUI's latest APIs.

### File Structure

```text
📂 App
 ├── MyApp.swift (App Entry Point)
 ├── 📂 Views
 │    ├── StartingView.swift (Onboarding / Landscape Warning)
 │    ├── GameView.swift (Main Story Engine / Dialogue Sequence)
 │    ├── CanvasView.swift (PencilKit Drawing Interface)
 │    ├── FinalView.swift (Cinematic Ending / Outro)
 │    └── CreditsView.swift (Rolling Credits Sequence)
 ├── 📂 ViewModels
 │    └── GameViewModel.swift (Central state manager & Story progression)
 ├── 📂 Models
 │    ├── Game.swift (Story Script / Sequence Definitions)
 │    └── Draw.swift (Asset sizing mapping)
 ├── 📂 Components
 │    ├── ClearButton.swift (PencilKit canvas clearer)
 │    └── DrawingCanvas.swift (UIViewRepresentable for PKCanvasView)
 ├── 📂 Other
 │    ├── CanvasViewModel.swift (Drawing image capture / PKCanvas bindings)
 │    ├── MusicPlayer.swift (AVFoundation singleton for background music)
 │    ├── MyCustomFonts.swift (Custom font registration pipeline)
 │    └── Navigation.swift (Custom Push Navigator using ScrollView hack)
 ├── Package.swift (Swift Playground manifest)
 └── 📂 Assets.xcassets (Visuals, Audio)
```

### Core Components

- **SwiftUI Core:** Centralized declarative UI mapped dynamically via an `@EnvironmentObject`.
- **MVVM Design Pattern:** 
  - `GameViewModel.swift` controls the global state, the current story index, and holds the user's drawings.
  - `Game.swift` acts as a static JSON-like script repository for dialogue and scene triggers.
- **PencilKit Integration:** Custom `UIViewRepresentable` wrapper (`DrawingCanvas.swift`) seamlessly embeds the Apple Pencil layout into SwiftUI, exporting `UIImage` data on submission.
- **AVFoundation:** Singleton pattern used in `MusicPlayer.swift` for continuous background audio loop regardless of view lifecycle changes.
- **Custom Typography:** Manual loading of TTF files through `CTFontManagerRegisterGraphicsFont` inside `MyCustomFonts.swift` to ensure unique narrative feeling.
- **Custom Navigation:** Circumventing standard push behavior through a hidden `NavigationLink` wrapped inside `Navigation.swift`.

## How To Run

1. Make sure you are using an iPad or Mac running **Xcode** or **Swift Playgrounds**.
2. Download or clone this repository.
3. Open `Fragments.swiftpm`.
4. Run the project in **Landscape** orientation for the intended experience.
5. Provide drawings when prompted, and proceed through the dialogue using the Next buttons.

## App Audit & Analysis

This project underwent a comprehensive App Engine and Runtime Audit to ensure WWDC-level polish, crash prevention, and optimal performance:

- **Cross-File Validation:** Dependency injection (`@EnvironmentObject`) is structurally sound. The `LazyDestination` custom architecture correctly prevents premature view instantiation before stack-pushes.
- **Performance Profiling:** SwiftUI's `.scaleEffect` leverages Metal under the hood, ensuring the final cinematic transitions scale fluidly from `0.1` to `50.0` at peak frame rates without stutters.
- **Crash Defense Mechanisms:** Native `UIViewRepresentables` for `PencilKit` are explicitly scoped in extensions to prevent memory bleed across context reloads.
- **Architectural Observations:** The central `GameViewModel` effectively centralizes the state, abstracting UI triggers and storyboard arrays away from the primary render loops. 


## Future Improvements & Known Issues
- Currently, the navigation uses a recursive stack push which may consume increased memory (`OOM`) on continuous loops. Future updates plan to migrate to an `AppCoordinator` state switch model.
- Dynamic asset fallbacks to be implemented.

## Acknowledgements

* Made specifically for Apple's WWDC Swift Student Challenge.
* Royalty-free ambient music: "Meditation" by Arulo (Mixkit).
* Custom Font: "Just Me Again Down Here" by Denis Masharov (Google Fonts).
* Special thanks to the Swift Club Parul University.

---
> Designed with ❤️ by Manav in India.
