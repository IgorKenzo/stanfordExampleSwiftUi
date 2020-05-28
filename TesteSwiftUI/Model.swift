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
    
    var indexFaceUpCard : Int? {
        get {
            //Era isso:
            
//            var faceUpCardsIndicies = [Int]()
//            for index in cards.indices {
//                if cards[index].isFaceUp {
//                    faceUpCardsIndicies.append(index)
//                }
//            }
//   ===========
//        Mudou para isso:
//            var faceUpCardsIndicies = cards.indices.filter { (index) -> Bool in
//                return cards[index].isFaceUp
//            }
//   ===========
//        E ficou assim:
//            let faceUpCardsIndicies = cards.indices.filter { cards[$0].isFaceUp }
//   ===========
//        Depois de tirar a funcao abaixo, ficou assim o codigo:
            return cards.indices.filter { cards[$0].isFaceUp }.only
            
//         Pode tirar, virou func de Array (Arra+Only)
//            if faceUpCardsIndicies.count == 1 {
//                return faceUpCardsIndicies.first
//            }
//            return nil
        }
        
        set{
            for index in cards.indices {
                cards[index].isFaceUp = index == newValue // newValue é propriedade do set
            }
        }
    }
    
    mutating func choose(card: Card){
        print("Card chosen: \(card)")
        if let chosenIndex : Int = cards.firstIndex(of: card), !cards[chosenIndex].isFaceUp, !cards[chosenIndex].isMatched {
            if let faceUpCardIndex = indexFaceUpCard {
                if cards[chosenIndex].content == cards[faceUpCardIndex].content {
                    cards[chosenIndex].isMatched = true
                    cards[faceUpCardIndex].isMatched = true
                }
                self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
            }
            else {
                indexFaceUpCard = chosenIndex
            }
            
        }
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
        var isFaceUp : Bool = false
        var isMatched : Bool = false
        var content : CardContent
        var id : Int
    }
}
