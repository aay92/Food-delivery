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
        Item.init(title: "Акции", image: "discount"),
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
    
    var availableDeliveries: [SalesItem] = [
        SalesItem.init(title: "KFC", image: "kfc"),
        SalesItem.init(title: "Пицца - крутотитца", image: "pizzaa"),
        SalesItem.init(title: "Шефф готовит", image: "cheff"),
        SalesItem.init(title: "Ташир", image: "tashir"),
        SalesItem.init(title: "Бургер Кинг", image: "burger")
    ]
    
    
    enum header {
        case category
        case kindsStores
        case availableDeliveries
        
        var item: String {
            switch self {
            case .category:
                return "Категория продуктов"
            case .kindsStores:
                return "Магазины"
            case .availableDeliveries:
                return "Доступные доставки"
            }
        }
    }
    
}

