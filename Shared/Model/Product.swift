//
//  Product.swift
//  E-commerce
//
//  Created by Divya on 18/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import Foundation
import FirebaseFirestore

struct Product {
    var name : String
    var  id : String
    var category : String
    var price : Double
    var imgurl : String
    var productDescription : String
    var favourite : Bool
    var stock : Int
    var timestamp : Timestamp
    
    init(data : [String : Any]) {
        self.name = data["name"] as? String ?? ""
        self.id = data["id"] as? String ?? ""
        self.imgurl = data["imgurl"] as? String ?? ""
        self.price = data["price"] as? Double ?? 0.0
        self.category = data["category"] as? String ?? ""
        self.stock = data["stock"] as? Int ?? 0
         self.productDescription = data["productDescription"] as? String ?? ""
        self.favourite = data["favourite"] as? Bool ?? true
        self.timestamp = data["timestamp"] as? Timestamp ?? Timestamp()
    }
}
