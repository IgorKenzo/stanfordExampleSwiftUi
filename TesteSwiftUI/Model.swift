//
//  Model.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 21/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    mutating func choose(card: Card){
        print("Card chosen: \(card)")
        let chosenIndex : Int = self.findIndex(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }
    
    func findIndex(of card: Card) -> Int
    {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
    
    init(numberOfPairOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card : Identifiable{
        var isFaceUp : Bool = true
        var isMatched : Bool = false
        var content : CardContent
        var id : Int
    }
}
