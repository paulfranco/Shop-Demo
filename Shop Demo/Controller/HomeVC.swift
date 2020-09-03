//
//  ViewController.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/28/20.
//

import UIKit

class HomeVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var featuredProductsCollectionView: UICollectionView!
    @IBOutlet weak var categoryTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        featuredProductsCollectionView.dataSource = self
        featuredProductsCollectionView.delegate = self
        
        categoryTableView.delegate = self
        categoryTableView.dataSource = self
    }
    
    // COLLECTION VIEW - FEATURED PRODUCTS
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let featuredProduct = DataService.instance.getFeaturedProducts()[indexPath.row]
        performSegue(withIdentifier: "goToProductDetails", sender: featuredProduct)
    }
    
    // TABLEVIEW - CATEGORIES
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.categoryTableView {
            let categories = DataService.instance.getCategories().count
            return categories
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryTableViewCell", for: indexPath) as? CategoryTableViewCell {
            let category = DataService.instance.getCategories()[indexPath.row]
            cell.updateViews(category: category)
            return cell
        } else {
            return CategoryTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let categories = DataService.instance.getCategories()
        let categorySelected = categories[indexPath.row]
        performSegue(withIdentifier: "goToProducts", sender: categorySelected)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // prepare for product details screen
        if let productDetailsVC = segue.destination as? ProductDetailsVC {
            
            //pass the shoe data to the productDetailsVC
            productDetailsVC.product = sender as? Product
        }
        if let productsVC = segue.destination as? ProductsVC {
            
            //pass the category data to the productsVC
            productsVC.category = sender as? Category
        }
    }
    
    // IBActions
    @IBAction func shoppingCartButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToCartFromMain", sender: (Any).self)    }
}
