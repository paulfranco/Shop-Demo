//
//  Cart.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/29/20.
//

import Foundation

struct Cart {
    var product: Product
    var quantity: Int
    var totalPrice: Int
    
    init(product: Product, quantity: Int, totalPrice: Int) {
        self.product = product
        self.quantity = quantity
        self.totalPrice = totalPrice
    }
    
}


