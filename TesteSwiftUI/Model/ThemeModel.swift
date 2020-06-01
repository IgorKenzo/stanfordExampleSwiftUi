//
//  ThemeModel.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 30/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

struct ThemeModel {
    var themes : [Theme]
    
    init() {
        themes = [
            Theme(name: "Animal", quantPair: 2, emojis: ["🐶","🐯"],color: ColorEnum.red),
            Theme(name: "Sports", quantPair: 4, emojis: ["🏹","⚾️","🏐","🤿"],color: ColorEnum.yellow),
            Theme(name: "Auto", quantPair: 6, emojis: ["🚗","🚕","🚙","🚌","🚎","🏎"],color: ColorEnum.green),
            Theme(name: "Objects", quantPair: 5, emojis: ["⌚️","📱","💻","⌨️","🖥"],color: ColorEnum.purple),
            Theme(name: "Numbers", quantPair: 10, emojis: ["0️⃣","1️⃣","2️⃣","3️⃣","4️⃣","5️⃣","6️⃣","7️⃣","8️⃣","9️⃣"],color: ColorEnum.blue),
            Theme(name: "Food", quantPair: 4, emojis: ["🍱","🍙","🍘","🍥"],color: ColorEnum.orange)
        ]
    }
    
    
    struct Theme : Identifiable {
        var name : String
        var quantPair : Int?
        var emojis : [String]
        var color : ColorEnum
        var id = UUID()
        
        init(name: String, quantPair: Int?, emojis: [String], color: ColorEnum) {
            self.name = name
            self.quantPair = quantPair
            self.emojis = emojis
            self.color = color
        }
    }
}
