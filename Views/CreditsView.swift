//
//  CreditsView.swift
//  In a Sheet of Paper
//
//  Created by ditthales on 18/04/23.
//

import SwiftUI

@MainActor
struct CreditsView: View {
    @State private var isTextHidden = true
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                VStack{
                Text("This experience was made\nespecially for Apple's WWDDC\nSwift Student Challenge 2026,\nIndia.\n\nRoyalties free music:\nMeditation by Arulo\nAvailable on mixkit.co\n\nCustom Fonts:\nMarck Script by Denis Masharov\nAvailable on Google Fonts\n\nIllustrations made by:\nmnv\n\nScript made by:\nmnv\n\nSpecial thanks to:\nSwift Club Parul University")
                    .font(Font.custom("JustMeAgainDownHere", size: 36))
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.horizontal, 40)
                    .onAppear {
                        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { _ in
                            withAnimation(.linear(duration: 10)) {
                                isTextHidden = false
                            }
                        }
                    }
                Image("thanks")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 300, alignment: .center)
            }
                .offset(y: isTextHidden ? geometry.size.height + 200 : -geometry.size.height - 500)
            .onChange(of: isTextHidden) { _ in
                withAnimation(.linear(duration: 15)) {
                }
            }
        }
        }
    }
}
