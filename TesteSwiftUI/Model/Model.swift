//
//  Model.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 21/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> where CardContent : Equatable {
    var cards: Array<Card>
    var theme : ThemeModel.Theme
    var points : Int = 0
    
    var indexFaceUpCard : Int? {
        get {
            return cards.indices.filter { cards[$0].isFaceUp }.only
        }
        
        set{
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue // newValue é propriedade do set
            }
        }
    }
    
    mutating func choose(card: Card){
        if let chosenIndex : Int = cards.firstIndex(of: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let faceUpCardIndex = indexFaceUpCard {
                if cards[chosenIndex].content == cards[faceUpCardIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[faceUpCardIndex].isMatched = true
                    points += 2
                }
                else {
                    if !cards[chosenIndex].wasFlipped {
                        cards[chosenIndex].wasFlipped = true
                    }
                    else {
                        points -= 1
                    }
                    
                    if !cards[faceUpCardIndex].wasFlipped {
                        cards[faceUpCardIndex].wasFlipped = true
                    }
                    else {
                        points -= 1
                    }
                }
                self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
            }
            else {
                indexFaceUpCard = chosenIndex
            }
            
        }
    }
    
    init(numberOfPairOfCards: Int,theme: ThemeModel.Theme , cardContentFactory: (Int) -> CardContent) {
        cards = Array<Card>()
        self.theme = theme
        for pairIndex in 0..<numberOfPairOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards.shuffle()
    }
    
    struct Card : Identifiable{
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var wasFlipped : Bool = false
        var content : CardContent
        var id : Int
    }
}
