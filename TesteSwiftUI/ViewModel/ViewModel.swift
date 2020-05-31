//
//  ViewModel.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 21/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

enum ColorEnum {
    case red
    case yellow
    case white
    case green
    case blue
    case orange
    
    func getColor() -> Color{
        switch self {
            case .red:
                return Color.red
            case .yellow:
                return Color.yellow
            case .white:
                return Color.white
            case .green:
                return Color.green
            case .blue:
                return Color.blue
            case .orange:
                return Color.orange
        }
    }
}

class EmojiMemoryGame : ObservableObject{
    @Published private var model : MemoryGame<String> = createMemoryGame()
    static private var themeModel : ThemeModel = ThemeModel()
        
    static func createMemoryGame() -> MemoryGame<String> {
        let theme : ThemeModel.Theme = themeModel.themes.randomElement()!
        return MemoryGame<String>(numberOfPairOfCards: Int.random(in: 2...theme.emojis.count),theme: theme, cardContentFactory: {(pairIndex) -> String in
            return theme.emojis[pairIndex]
        })
    }
    
    var cards : Array<MemoryGame<String>.Card>
    {
        return model.cards
    }
    
    var themeColor: Color {
        return model.theme.color.getColor()
    }
    
    var themeName : String {
        return model.theme.name
    }
    
    var points : Int {
        return model.points
    }
    
    //MARK: - Intents
    func newGame()
    {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func choose(card: MemoryGame<String>.Card){
        //objectWillChange.send() intent: Fala para o ObservableObjectPublisher que algo vai muda. O @Published replace esse comando
        model.choose(card: card)
    }

}
