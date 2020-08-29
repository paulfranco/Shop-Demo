//
//  CartTableViewCell.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/29/20.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var productPrice: UILabel!
    @IBOutlet weak var quantityLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func quantityLessButtonPressed(_ sender: UIButton) {
    }
    @IBAction func quantityMoreButtonPressed(_ sender: UIButton) {
    }
    
}
