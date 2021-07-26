//
//  Extensions.swift
//  E-commerce
//
//  Created by Divya on 16/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import Foundation
import UIKit
import Firebase


extension String
{
    var isNotEmpty : Bool
    {
        return !isEmpty
    }
    
}

extension UIViewController
{
   
    func SimpleAlert(title : String,msg : String)
    {
        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

