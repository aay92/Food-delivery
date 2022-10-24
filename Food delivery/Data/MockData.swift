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
        .category([.init(title: "Молочные продукты", image: "8"),
                   .init(title: "Хлебобулочные изделия", image: "sun.min.fill"),
                   .init(title: "Кондитерские изделия", image: "sun.dust.fill"),
                   .init(title: "Колбасные изделия", image: "moon.circle.fill"),
                   .init(title: "Напитки", image: "cloud.drizzle")
                  ])
    }()
    
    var pageData: [ItemSection] {
        [category]
    }
}
