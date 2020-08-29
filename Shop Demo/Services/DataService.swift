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
        Product(productTitle: "Morelia Series 1", productImage: "morelia1.png", productPrice: 19.99, productDescription: "Building on the original blueprint of the boot, the Morelia has been given an injection of innovation thanks to its new, lightweight materials that offer a barefoot feeling, resulting in a more comfortable, natural touch on the pitch. A boot released to usher in a new decade for Mizuno, this new modern boot has been designed with one thing in mind: speed"),
        Product(productTitle: "Morelia Series 2", productImage: "morelia2.png", productPrice: 29.99, productDescription: "djkjs djsk jdsk dj djks djk dsdj ksd ks"),
        Product(productTitle: "Morelia Series 1", productImage: "morelia1.png", productPrice: 19.99, productDescription: "djkjs djsk jdsk dj djks djk dsdj ksd ks"),
        Product(productTitle: "Morelia Series 2", productImage: "morelia2.png", productPrice: 29.99, productDescription: "djkjs djsk jdsk dj djks djk dsdj ksd ks")
    ]
    
    func getFeaturedProducts() -> [Product] {
        return featuredProducts
    }
}
