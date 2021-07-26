//
//  Category.swift
//  E-commerce
//
//  Created by Divya on 18/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import Foundation
import UIKit
import FirebaseFirestore

struct Category {
    var name : String
    var  id : String
    var imgurl : String
    var isActive : Bool = true
    var timestamp : Timestamp
    
    init(data : [String : Any]) {
        self.name = data["name"] as? String ?? ""
        self.id = data["id"] as? String ?? ""
        self.imgurl = data["imgurl"] as? String ?? ""
        self.isActive = data["isActive"] as? Bool ?? true
        self.timestamp = data["timestamp"] as? Timestamp ?? Timestamp()
    }
}
