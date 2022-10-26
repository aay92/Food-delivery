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
        .category([.init(title: "Молочные продукты", image: "1"),
                   .init(title: "Хлебобулочные изделия", image: "2"),
                   .init(title: "Кондитерские изделия", image: "3"),
                   .init(title: "Колбасные изделия", image: "4"),
                   .init(title: "Напитки", image: "5")
                  ])
    }()
    
    var pageData: [ItemSection] {
        [category]
    }
}
