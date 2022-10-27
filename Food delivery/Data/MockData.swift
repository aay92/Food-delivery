//
//  MockData.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 23.10.2022.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    private var category: ItemSection = {
        .category([.init(title: "Молочные продукты", image: "milk"),
                   .init(title: "Хлебобулочные изделия", image: "bread"),
                   .init(title: "Кондитерские изделия", image: "candy"),
                   .init(title: "Колбасные изделия", image: "steak"),
                   .init(title: "Напитки", image: "drink")
                  ])
    }()
    
    var pageData: [ItemSection] {
        [category]
    }
}
