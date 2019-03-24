//
//  ViewController.swift
//  GoodEatins
//
//  Created by Antonakakis Nikolaos on 23.03.19.
//  Copyright © 2019 Antonakakis Nikolaos. All rights reserved.
//

import UIKit
// implemented our 2 protocols that we need
class HomeVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    @IBOutlet weak var tableView: UITableView!
    
    let data = DataSet()
    var categoryToPass: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // we set those protocols to self so the tableview can notify us when certain things happen
        // and give it info about certain actions
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // ... such as determine the number of rows to display
        return data.categories.count
    }
    
    // ... and what cell to display
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell {
            cell.configureCell(category: data.categories[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }
    
    // as well as the height for the rows
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    // we need the tableview to tell us when we have selected the cell
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // set the table's value that we want to pass, having an empty variable on the other side, at RecipesSelectionVC, i.e. var selectedCategory: String!
        categoryToPass = data.categories[indexPath.row].title
        // then perform the segue
        performSegue(withIdentifier: "toRecipesSelection", sender: self)
    }
    
    // and then prepare for segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let recipesVC = segue.destination as? RecipesSelectionVC {
            // setting the variable's value on the other side equal to the one we want to pass
            recipesVC.selectedCategory = categoryToPass
        }
    }

}

