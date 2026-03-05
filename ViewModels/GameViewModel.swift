import SwiftUI

@MainActor
final class GameViewModel: ObservableObject {
    @Published var userDraws: [UIImage] = []
    @Published var currentIndex: Int = 0
    
    let gameInfos: [Game] = Game.getGameInfos()
    
    var currentRules: Game {
        if currentIndex < gameInfos.count {
            return gameInfos[currentIndex]
        }
        return gameInfos.last! // Fallback
    }
    
    func nextSequence() {
        if currentIndex < gameInfos.count - 1 {
            currentIndex += 1
        }
    }
    
    func addDraw(_ image: UIImage) {
        userDraws.append(image)
    }
}
