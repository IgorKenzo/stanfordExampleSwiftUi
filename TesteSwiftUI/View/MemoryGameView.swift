//
//  ContentView.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 20/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        VStack {
            HStack{
                Text(viewModel.themeName)
                Spacer()
                Text("Points: \(viewModel.points)")
                Spacer()
                Button("New Game",action: viewModel.newGame)
            }
                .padding(30)
            
            Grid(viewModel.cards){ card in
                //ForEach(viewModel.cards, content: { card in
                CardView(card: card).onTapGesture {
                    self.viewModel.choose(card: card)
                }
                .padding()
                //})//.foregroundColor(.orange) seta para todos os filhos a cor laranja
            }
            .padding()
            .foregroundColor(viewModel.themeColor)
        }
         
    }
}


struct CardView : View {
    var card : MemoryGame<String>.Card
    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }

    @ViewBuilder
    private func body(for size: CGSize) -> some View {
        if card.isFaceUp || !card.isMatched {
            ZStack {
                Pie(startAngle: .degrees(0-90), endAngle: .degrees(110-90),clockwise: true).padding().opacity(0.6)
                Text(card.content).font(Font.system(size: min(size.width, size.height) * 0.5))
                
            }
            .cardify(isFaceUp: card.isFaceUp)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        game.choose(card: game.cards[0])
        return MemoryGameView(viewModel: game)
    }
}
