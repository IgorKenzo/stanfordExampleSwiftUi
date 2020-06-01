//
//  Cardify.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 01/06/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct Cardify : ViewModifier {
    
    var isFaceUp : Bool
    
    func body(content: Content) -> some View {
        ZStack {
            if isFaceUp
            {
                RoundedRectangle(cornerRadius: 10.0).stroke(lineWidth: 2)
                RoundedRectangle(cornerRadius: 10.0).fill(Color.white)
                content
            }
            else {
                RoundedRectangle(cornerRadius: 10.0).fill()
            }
        }
    }
}

extension View {
    func cardify(isFaceUp : Bool) -> some View {
        return self.modifier(Cardify(isFaceUp: isFaceUp))
    }
}
