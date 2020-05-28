//
//  Array+Only.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 28/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation

extension Array {
    var only : Element? {
        count == 1 ? first : nil
    }
    
}
