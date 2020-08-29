//
//  DataService.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/28/20.
//

import Foundation

class DataService {
    static let instance = DataService()
    
    private let featuredProducts = [
        Product(productTitle: "Morelia Series 1", productImage: "morelia1.png", productPrice: 19.99),
        Product(productTitle: "Morelia Series 2", productImage: "morelia2.png", productPrice: 29.99),
        Product(productTitle: "Morelia Series 1", productImage: "morelia1.png", productPrice: 19.99),
        Product(productTitle: "Morelia Series 2", productImage: "morelia2.png", productPrice: 29.99)
    ]
    
    func getFeaturedProducts() -> [Product] {
        return featuredProducts
    }
}
