
import SwiftUI

@MainActor
struct CanvasView: View {
    
    @EnvironmentObject var gameViewModel: GameViewModel
    let draw = Draw.getDraws()
    @State var baseImage: Image?
    @ObservedObject private var viewModel = CanvasViewModel()
    
    
    var body: some View {
        ZStack(alignment: .center){
            
            Color.black
            
            
            Image(gameViewModel.currentRules.baseImage)
            
            
            DrawingCanvas(canvasView: $viewModel.canvasView)
            
            
            
            VStack{
                
                Text(gameViewModel.currentRules.bottomText)
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .font(Font.custom("JustMeAgainDownHere", size: 36))
                    .frame(maxWidth: .infinity, alignment: .center)
                
                
                Spacer()
                
                
                
                HStack(alignment: .bottom, spacing: 0) {
                    
                    ClearButton { 
                        viewModel.clearDrawing()
                        
                    }
                    
                    Spacer()
                    
                    NavigationButton {
                        viewModel.doneButtonPressed { image in
                            gameViewModel.addDraw(image)
                            gameViewModel.nextSequence()
                        }
                    } destination: {
                        GameView()
                    } label: {
                        Image("doneButtom")
                    }

                    
                    
                }
            }.padding(.horizontal, 32)
                .padding(.vertical, 48.0)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .navigationBarBackButtonHidden()
    }
    
    
    
    
}

struct Canvas_Previews: PreviewProvider {
    static var previews: some View {
        ClearButton(actionForDone: {
            
        })
    }
}
