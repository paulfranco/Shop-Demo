//
//  ProductsVCViewController.swift
//  Shop Demo
//
//  Created by Paul Franco on 8/31/20.
//

import UIKit

class ProductsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var productsTableView: UITableView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    private(set) public var products = [Product]()
    var category: Category!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        productsTableView.delegate = self
        productsTableView.dataSource = self

        // Do any additional setup after loading the view.
        if let selectedCategory = category {
            initProducts(category: selectedCategory)
        }
            
       
        
    }
    
    func initProducts(category: Category) {
        products = DataService.instance.getProducts(categoryTitle: category.title)
        categoryLabel.text = category.title
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == self.productsTableView {
            return products.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ProductsTableViewCell", for: indexPath) as? ProductsTableViewCell {
            let item = products[indexPath.row]
            cell.updateView(product: item)
            print("*************reached here*****************")
            return cell
        } else {
            print("************hahahahahahhahahahaha**********")
            return ProductsTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedProduct = products[indexPath.row]
        performSegue(withIdentifier: "goToDetailFromProducts", sender: selectedProduct)
    }
    
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productDetailsVC = segue.destination as? ProductDetailsVC {
            
            //pass the shoe data to the productDetailsVC
            productDetailsVC.product = sender as? Product
        }
    }
    
    
}
