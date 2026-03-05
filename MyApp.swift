import SwiftUI

@main
struct MyApp: App {
    
    init() {
        CustomFonts.register()
    }
    @StateObject var gameViewModel = GameViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView{
                StartingView()
                    .onAppear{
                        MusicPlayer.shared.play()
                    }
            }
            .navigationViewStyle(.stack)
            .environmentObject(gameViewModel)
        }
    }
}
