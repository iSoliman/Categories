//
//  CategoryViewController.swift
//  Categories
//
//  Created by Islam Soliman on 11/25/19.
//  Copyright © 2019 Islam Soliman. All rights reserved.
//

import UIKit

class CategoryViewController: UIViewController {

    private let cellId = "CellID"
    var presenter: CategoryPresenter?
    @IBOutlet var categoriesTableView: UITableView!
    var categories: [String]?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        presenter = CategoryPresenter(scene: self)
        presenter?.loadCategories()
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

}

extension CategoryViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return categories?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId)!
        
        cell.textLabel?.text = categories![indexPath.row]
        
        return cell
    }
    
    
    
}

protocol CategoryViewProtocol: AnyObject {
    
    func categoriesDidLoadSuccessfully(_ categories: [String])
    func errorCallingAPI(errorMsg: String)
}

extension CategoryViewController: CategoryViewProtocol {
    
    func categoriesDidLoadSuccessfully(_ categories: [String]) {
        
        self.categories = categories
        categoriesTableView.reloadData()
    }
    
    func errorCallingAPI(errorMsg: String) {
        
        print(errorMsg)
    }
}
