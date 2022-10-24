//
//  itemSection.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 23.10.2022.
//

import Foundation

enum ItemSection {
    case category([Item])
    
    var item: [Item]{
        switch self {
        case .category( let item):
            return item
        }
    }
    
    var count: Int {
        return item.count
    }
    
    var title: String {
        switch self {
        case .category(_):
            return "Категория"
        }
    }
}
