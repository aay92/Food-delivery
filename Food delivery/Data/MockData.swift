//
//  MockData.swift
//  Food delivery
//
//  Created by Aleksey Alyonin on 23.10.2022.
//

import Foundation

struct MockData {
    
    static let shared = MockData()
    
    var category: [Item] = [
        Item.init(title: "Молочные продукты", image: "milk"),
        Item.init(title: "Хлебобулочные изделия", image: "bread"),
        Item.init(title: "Кондитерские изделия", image: "candy"),
        Item.init(title: "Колбасные изделия", image: "steak"),
        Item.init(title: "Напитки", image: "drink")
    ]
    var kindsStores: [SalesItem] = [
        SalesItem.init(title: "Магнит", image: "magnit"),
        SalesItem.init(title: "Метро", image: "metro"),
        SalesItem.init(title: "Пятерочка", image: "5"),
        SalesItem.init(title: "Самокат", image: "samocat"),
        SalesItem.init(title: "Перекресток", image: "perecrestok")
    ]
//
//    private var category: Item = [.init(title: "Молочные продукты", image: "milk"),
//                   .init(title: "Хлебобулочные изделия", image: "bread"),
//                   .init(title: "Кондитерские изделия", image: "candy"),
//                   .init(title: "Колбасные изделия", image: "steak"),
//                   .init(title: "Напитки", image: "drink")
//                  ])
//    }()
    
//    private var kindsStores: SalesItem = {
//        .kindsStores([.init(title: "Магнит", image: "milk"),
//                   .init(title: "Пятерочка", image: "bread"),
//                   .init(title: "Метро", image: "candy"),
//                   .init(title: "Самокат", image: "steak"),
//                   .init(title: "Перекресток", image: "drink")
//                  ])
//    }()
//
//    var pageData: [ItemSection] {
//        [category]
//    }
//    
//    var pageDataKind: [ItemSection] {
//        [kindsStores]
//    }
}
