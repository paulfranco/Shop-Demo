//
//  FeaturedCell.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/28/20.
//

import UIKit

class FeaturedCell: UICollectionViewCell {
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    
    
    func updateView(product: Product) {
        productImage.image = UIImage(named: product.productImage)
        productTitle.text = product.productTitle
        productPrice.text = String(product.productPrice)
    }
}
