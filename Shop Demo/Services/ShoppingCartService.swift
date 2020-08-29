//
//  ShoppingCartService.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/29/20.
//

import Foundation

class ShoppingCartService {
    static let instance = ShoppingCartService()
    private(set) var cart: Cart!
    private(set) var shoppingCartItems = [Cart]()
    
    func getCart() -> [Cart] {
        //return the current cart item array
        return shoppingCartItems
    }
    
    
    
    
}
