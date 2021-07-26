//
//  CategoryCollectionViewCell.swift
//  E-commerce
//
//  Created by Divya on 18/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import UIKit
import Kingfisher

class CategoryCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var CategoryImg: UIImageView!
    
    @IBOutlet weak var CategoryLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        CategoryImg.layer.cornerRadius = 5
        
    }

    func configureCell(category : Category)
    {
        CategoryLbl.text = category.name
        if let url = URL(string: category.imgurl)
        {
            let placeholder = UIImage(named: "placeholder")
            let option : KingfisherOptionsInfo = [KingfisherOptionsInfoItem.transition(.fade(0.1))]
            CategoryImg.kf.indicatorType = .activity
            CategoryImg.kf.setImage(with: url,placeholder: placeholder,options: option)
            
        }
    }
}
