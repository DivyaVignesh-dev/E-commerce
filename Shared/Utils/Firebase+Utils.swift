//
//  Firebase+Utils.swift
//  E-commerce
//
//  Created by Divya on 18/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import Foundation
import UIKit
import Firebase

extension Auth
{
    func handlefireauthError(error : Error, vc : UIViewController)
       {
           if let errorcode = AuthErrorCode(rawValue: error._code)
           {
               let alert = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
               let okaction = UIAlertAction.init(title: "OK", style: .default, handler: nil)
               alert.addAction(okaction)
            vc.present(alert, animated: true, completion: nil)
           }
           
       }
}
extension Firestore
{
    var queryCategory : Query
    {
        return collection("Category").order(by: "timestamp")
    }
    
    func products(category : String) -> Query
    {
        return collection("Product").whereField("category", isEqualTo: category).order(by: "timestamp", descending: true)
    }
}

extension AuthErrorCode
{
    var errorMsg : String
    {
        switch self {
        case .emailAlreadyInUse:
            return "The email is already in use with another account. Pick another email!"
        case .userNotFound:
            return "Account not found for the specified user. Please check and try again"
        case .userDisabled:
            return "Your account has been disabled. Please contact support."
        case .invalidEmail, .invalidSender, .invalidRecipientEmail:
            return "Please enter a valid email"
        case .networkError:
            return "Network error. Please try again."
        case .weakPassword:
            return "Your password is too weak. The password must be 6 characters long or more."
        case .wrongPassword:
            return "Your password or email is incorrect."
            
        default:
            return "Sorry, something went wrong."
        }
    }
}
