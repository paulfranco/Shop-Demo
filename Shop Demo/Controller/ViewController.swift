//
//  ViewController.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/28/20.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var featuredProductsCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        featuredProductsCollectionView.dataSource = self
        featuredProductsCollectionView.delegate = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.featuredProductsCollectionView {
            return DataService.instance.getFeaturedProducts().count
        }
        return DataService.instance.getFeaturedProducts().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.featuredProductsCollectionView {
            let featuredProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FeaturedProducts", for: indexPath) as! FeaturedCell
            let featuredProducts = DataService.instance.getFeaturedProducts()[indexPath.row]
            featuredProductCell.updateView(product: featuredProducts)
            return featuredProductCell
        }
        return FeaturedCell()
    }

}

