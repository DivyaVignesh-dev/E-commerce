//
//  ProductTableViewCell.swift
//  E-commerce
//
//  Created by Divya on 18/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import UIKit
import Kingfisher

class ProductTableViewCell: UITableViewCell {
    @IBOutlet weak var productTitle: UILabel!
    
    @IBOutlet weak var favouriteBtn: UIButton!
    @IBOutlet weak var productprice: UILabel!
    @IBOutlet weak var productImg: RoundedImgView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBAction func AddTocart(_ sender: Any) {
    }
    
    @IBAction func favouriteAction(_ sender: Any) {
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configureCell(product : Product)
     {
        productTitle.text = product.name
        productprice.text = String(product.price)
        
        if let url = URL(string: product.imgurl)
        {
            productImg.kf.setImage(with: url)
        }
     }
}
