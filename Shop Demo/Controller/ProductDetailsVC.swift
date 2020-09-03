//
//  ProductDetailsVC.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/29/20.
//

import UIKit

class ProductDetailsVC: UIViewController {
    
    var product: Product!

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productDetailsLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        if let product = product {
            productImage.image = UIImage(named: product.productImage)
            productTitleLabel.text = product.productTitle
            productPriceLabel.text = String(product.productPrice)
            productDetailsLabel.text = product.productDescription
        }
    }
    
    @IBAction func buyButton(_ sender: UIButton) {
        if let product = product {
            ShoppingCartService.instance.addProductToCart(productAdded: product)
        }
        performSegue(withIdentifier: "goToCart", sender: product)
        
    }
    
    @IBAction func shoppingCartButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCart", sender: (Any).self)
    }
}
