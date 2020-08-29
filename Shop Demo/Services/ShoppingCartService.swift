//
//  ShoppingCartService.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/29/20.
//

import Foundation

class ShoppingCartService {
    static let instance = ShoppingCartService()
    private(set) var item: Cart!
    private(set) var shoppingCartItems = [Cart]()
    
    func getCart() -> [Cart] {
        return shoppingCartItems
    }
    
    func addProductToCart(productAdded: Product?) {
        if let product = productAdded {
            //create a product item
            item = Cart(product: product, quantity: 1, totalPrice: product.productPrice)
            
            //  check if the incoming product is already in the cart
            // Referencing instance method 'contains' on 'Sequence' requires that 'Cart' conform to 'Equatable'
            if shoppingCartItems.contains(item) {
                // if it is then modify the quantity of the item
                handleCartItemQuantity(addCart: item, addCartItemAction: 1)
            }
            else {
                //its not in the cart - add the shoe
                shoppingCartItems.append(item)
            }
        }
    }
    
}
