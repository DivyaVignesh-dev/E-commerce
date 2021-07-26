//
//  LoginViewController.swift
//  E-commerce
//
//  Created by Divya on 15/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var passwordTf: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.activityIndicator.isHidden = true
        self.activityIndicator.hidesWhenStopped = true
        
        // Do any additional setup after loading the view.
    }
    @IBAction func createUser(_ sender: Any) {
    }
    @IBAction func loginnAction(_ sender: Any) {
        
        guard let email = emailTF.text, email.isNotEmpty ,let pass = passwordTf.text,pass.isNotEmpty else {
             SimpleAlert(title: "Error", msg: "Pls fill all fields")
            return }
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        Auth.auth().signIn(withEmail: email, password: pass) { [weak self] authResult, error in
            
            if let error = error
            {
                print(error.localizedDescription)
                Auth.auth().handlefireauthError(error: error,vc: self!)
                self!.activityIndicator.stopAnimating()
                return
                vxyp5ce
            }
            self!.activityIndicator.stopAnimating()
            self!.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func forgotpasswordAction(_ sender: Any) {
        let vc = ForgotpassViewController()
        vc.modalPresentationStyle = .overCurrentContext //or .overFullScreen for transparency
        self.present(vc, animated: true, completion: nil)
    }
    
    
}
