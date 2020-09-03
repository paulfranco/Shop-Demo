//
//  CartVC.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/29/20.
//

import UIKit

class CartVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ParentTableViewControllerDelegate {
    
    @IBOutlet weak var subtotalLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var shoppingCartTableView: UITableView!
    
    var shoppingCartItems = ShoppingCartService.instance.getCart()
    var subtotal: Double = 0.00
    var shipping: Double = 10.00
    var tax: Double = 0.00
    var totalPrice: Double = 0.00
    

    override func viewDidLoad() {
        super.viewDidLoad()
        shoppingCartTableView.delegate = self
        shoppingCartTableView.dataSource = self

        getShoppingCartTotalPrice()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingCartItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CartTableViewCell", for: indexPath) as? CartTableViewCell {
                    let cartProduct = shoppingCartItems[indexPath.row]
                    
                    cell.updateViews(item: cartProduct)
                    cell.parentTableViewDelegate = self
                    return cell
                }
                else {
                    return CartTableViewCell()
                }
        
    }
    
    func getShoppingCartTotalPrice() {
        var itemTotalPrice: Double = 0.00
        var cartTotal: Double = 0.00
        
        for item in shoppingCartItems {
            
            itemTotalPrice = Double(item.quantity) * item.totalPrice
            cartTotal += itemTotalPrice
            
        }
        subtotal = cartTotal
        tax = subtotal * 0.10
        totalPrice = subtotal + tax + shipping
        
        
        subtotalLabel.text = "$ \(subtotal)"
        taxLabel.text = "$ \(tax)"
        shippingLabel.text = "$ \(shipping)"
        totalLabel.text = "$ \(totalPrice)"
    }
    
    
    
    func requestReloadTableViewData() {
            shoppingCartItems = ShoppingCartService.instance.getCart()
            getShoppingCartTotalPrice()
            shoppingCartTableView.reloadData()
    }
    @IBAction func purchaseButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "PaymentSuccess", sender: (Any).self)
    }
    
}

protocol ParentTableViewControllerDelegate {
    func requestReloadTableViewData()
}
