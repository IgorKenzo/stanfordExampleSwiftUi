//
//  ViewModel.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 21/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

class EmojiMemoryGame : ObservableObject{
    @Published private var model : MemoryGame<String> = createMemoryGame()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["🤖","🤝","🧠","👾","👽"]
        return MemoryGame<String>(numberOfPairOfCards: Int.random(in: 2...emojis.count), cardContentFactory: {(pairIndex) -> String in
            return emojis[pairIndex]
        })
    }
    
    var cards : Array<MemoryGame<String>.Card>
    {
        return model.cards
    }
    
    //MARK: - Intents
    func choose(card: MemoryGame<String>.Card){
        //objectWillChange.send() intent: Fala para o ObservableObjectPublisher que algo vai muda. O @Published replace esse comando
        model.choose(card: card)
    }

}
