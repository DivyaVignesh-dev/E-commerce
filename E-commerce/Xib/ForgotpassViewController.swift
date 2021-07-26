//
//  ForgotpassViewController.swift
//  E-commerce
//
//  Created by Divya on 17/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import UIKit
import Firebase

class ForgotpassViewController: UIViewController {
    @IBOutlet weak var forgotView: UIView!
    
    @IBOutlet weak var cancel: UIButton!
    @IBOutlet weak var resetpass: UIButton!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
 

        // Do any additional setup after loading the view.
    }

    @IBAction func resetAction(_ sender: Any) {
       guard let email = emailTF.text, email.isNotEmpty  else {
                  SimpleAlert(title: "Error", msg: "Pls fill all fields")
                  return }
        
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            
            if let error = error
            {
                print(error.localizedDescription)
                Auth.auth().handlefireauthError(error: error,vc: self)
            }
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
   
}
