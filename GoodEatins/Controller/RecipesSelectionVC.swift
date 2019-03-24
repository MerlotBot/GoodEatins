//
//  RecipesSelectionVC.swift
//  GoodEatins
//
//  Created by Antonakakis Nikolaos on 24.03.19.
//  Copyright © 2019 Antonakakis Nikolaos. All rights reserved.
//

import UIKit

class RecipesSelectionVC: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var selectedCategory: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(selectedCategory)
    }

}
