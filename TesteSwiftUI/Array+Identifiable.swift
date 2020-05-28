//
//  Array+Identifiable.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 28/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import Foundation
extension Array where Element : Identifiable {
    func firstIndex(of element: Element) -> Int?
    {
        for index in 0..<self.count {
            if self[index].id == element.id {
                return index
            }
        }
        return nil
    }
}
