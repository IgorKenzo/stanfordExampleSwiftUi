//
//  ContentView.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 20/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel : EmojiMemoryGame
    
    var body: some View {
        return Grid(viewModel.cards){ card in
            //ForEach(viewModel.cards, content: { card in
            CardView(card: card).onTapGesture {
                self.viewModel.choose(card: card)
            }
            .padding()
            //})//.foregroundColor(.orange) seta para todos os filhos a cor laranja
        }
        .padding()
        .foregroundColor(.orange)
    }
}

struct CardView : View {
        var card : MemoryGame<String>.Card
        var body: some View {
            GeometryReader { geometry in
                ZStack(content: {
                    if self.card.isFaceUp
                    {
                        RoundedRectangle(cornerRadius: 10.0).stroke()
                        RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                        Text(self.card.content)
                    }
                    else {
                        RoundedRectangle(cornerRadius: 10.0).fill()
                    }
                })
                    .font(Font.system(size: min(geometry.size.width, geometry.size.height) * 0.8))
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}