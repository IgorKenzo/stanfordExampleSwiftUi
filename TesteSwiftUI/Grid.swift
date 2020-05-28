//
//  Grid.swift
//  TesteSwiftUI
//
//  Created by Igor Kenzo Miyamoto Dias on 28/05/20.
//  Copyright © 2020 Igor Miyamoto. All rights reserved.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item : Identifiable, ItemView : View{
    var items : [Item]
    var viewForItem : (Item) -> ItemView
    
    init(_ items : [Item], viewForItem: @escaping (Item) -> ItemView){
        self.items = items
        self.viewForItem = viewForItem
    }
    
    var body: some View {
        GeometryReader { geometry in
            self.body(for: GridLayout(itemCount: self.items.count, in: geometry.size))
           
        }
        
    }
    
    func body(for layout: GridLayout) -> some View{
        ForEach(self.items) { item in
            self.body(for: item, in: layout)
        }
        
    }
    func body(for item: Item, in layout: GridLayout) -> some View {
        let index = self.items.firstIndex(of: item)!
        return viewForItem(item)
            .frame(width: layout.itemSize.width, height: layout.itemSize.height)
            .position(layout.location(ofItemAt: index))
    }
    
}

