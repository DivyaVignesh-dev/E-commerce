//
//  ViewController.swift
//  Admin-E-Commerce
//
//  Created by Divya on 15/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import UIKit

class AdminhomeViewController: HomeViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem?.isEnabled = false
        let addcategoryBtn = UIBarButtonItem(title: "Add Category", style: .plain, target: self, action: #selector(AddCategory))
        navigationItem.rightBarButtonItem = addcategoryBtn
    }
    @objc func AddCategory()
    {
        
    }
    
}

