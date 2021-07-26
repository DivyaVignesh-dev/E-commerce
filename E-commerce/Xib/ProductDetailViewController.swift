//
//  ProductDetailViewController.swift
//  E-commerce
//
//  Created by Divya on 21/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import UIKit

class ProductDetailViewController: UIViewController {
    
    var product : Product!
    @IBOutlet weak var productTitle: UILabel!
    @IBOutlet weak var price: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var productdescription: UILabel!
    
    @IBOutlet weak var bgView: UIVisualEffectView!
    override func viewDidLoad() {
        super.viewDidLoad()
        productTitle.text = product.name
        productdescription.text = product.productDescription
        
        if let url = URL(string: product.imgurl)
        {
            imgView.kf.setImage(with: url)
        }
        // Do any additional setup after loading the view.
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        if let priceval = formatter.string(from: product.price as NSNumber)
        {
            price.text = priceval
        }
        
    
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismiss(animated:completion:)))
        tap.numberOfTapsRequired = 1
        bgView.addGestureRecognizer(tap)
        
    }
 
    @IBAction func addCart(_ sender: Any) {
          dismiss(animated: true, completion: nil)
    }
    

    @IBAction func keepshopping(_ sender: Any) {
         dismiss(animated: true, completion: nil)
    }
    
 @objc func dismisproduct()
  {
      dismiss(animated: true, completion: nil)
  }
}
