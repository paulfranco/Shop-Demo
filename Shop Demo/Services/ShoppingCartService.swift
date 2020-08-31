//
//  ShoppingCartService.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/29/20.
//

import Foundation

class ShoppingCartService {
    static let instance = ShoppingCartService()
    private(set) var item: Item!
    private(set) var shoppingCartItems = [Item]()
    
    func getCart() -> [Item] {
        return shoppingCartItems
    }
    
    func addProductToCart(productAdded: Product?) {
        if let product = productAdded {
            //create a shoppingCart
            item = Item(product: product, quantity: 1, totalPrice: product.productPrice)
            
            if shoppingCartItems.contains(item) {
                // if it is then modify the quantity of the item
                updateShoppingCartItemQuantity(items: item, itemsPurchased: 1)
            }
            else {
                //its not in the cart - add the shopingCart
                shoppingCartItems.append(item)
            }
        }
    }
    
    func updateShoppingCartItemQuantity(items cartItems: Item, itemsPurchased purchased: Int) {
        
        //get the index of the cart item array
        if let itemIndex = shoppingCartItems.firstIndex(of: cartItems) {
            //assign the content of the incoming cartItems array to cart
            item = cartItems
            //get the current quantity
            var quantity = shoppingCartItems[itemIndex].quantity
            
            //add
            if purchased == 1 {
                quantity += 1
            }
            //subtract
            else if purchased == 0 {
                quantity -= 1
                if quantity == 0 {
                    //remove the item from the shopping cart array
                    shoppingCartItems.remove(at: itemIndex)
                    //exit out of function
                    return
                }
            }
            //set the new quantity to the shopping cart item quantity
            item.quantity = quantity
            //update the shopping cart item array with the new shopping cart array
            shoppingCartItems[itemIndex] = item
        }
    }
    
    func clearShoppingCartItems() {
        shoppingCartItems.removeAll()
    }
    
}
