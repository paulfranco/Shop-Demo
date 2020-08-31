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
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func buyButton(_ sender: UIButton) {
        if let product = product {
            ShoppingCartService.instance.addProductToCart(productAdded: product)
        }
        performSegue(withIdentifier: "goToCart", sender: product)    }
    
}
