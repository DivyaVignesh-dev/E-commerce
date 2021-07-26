//
//  RoundedViews.swift
//  E-commerce
//
//  Created by Divya on 17/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//


import UIKit


class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
          layer.cornerRadius = 5
      }
    
}

class RoundedShadowView: UIView {
       
    override func awakeFromNib() {
     super.awakeFromNib()
        layer.cornerRadius = 5
        layer.shadowColor = AppColors.Blue.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset = CGSize.zero
        layer.shadowRadius = 3
        
    
    }
}

class RoundedImgView : UIImageView
{
    override func awakeFromNib() {
    super.awakeFromNib()
       layer.cornerRadius = 5
    }
}
