//
//  RegisterViewController.swift
//  E-commerce
//
//  Created by Divya on 15/07/21.
//  Copyright © 2021 Divya. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {
    @IBOutlet weak var emailTF: UITextField!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var confirmPassTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    
    @IBOutlet weak var passCheck: UIImageView!
    
    @IBOutlet weak var confirmpasscheck: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.isHidden = true
        self.activityIndicator.hidesWhenStopped = true
        
        passwordTF.addTarget(self, action: #selector(textFieldDidchange(_:)), for: UIControl.Event.editingChanged)
        
        confirmPassTF.addTarget(self, action: #selector(textFieldDidchange(_:)), for: UIControl.Event.editingChanged)
        
        // Do any additional setup after loading the view.
    }
    
    @objc func textFieldDidchange(_ textfield : UITextField)
    {
        
        if textfield == confirmPassTF
        {
            passCheck.isHidden = false
            confirmpasscheck.isHidden = false
        }else{
            if let pass = passwordTF.text, pass.isEmpty{
                passCheck.isHidden = true
                confirmpasscheck.isHidden = true
                confirmPassTF.text = ""
            }
        }
        if passwordTF.text == confirmPassTF.text
        {
            passCheck.image = UIImage(named: "green_check")
            confirmpasscheck.image = UIImage(named: "green_check")
            
        }
        else
        {
            
            passCheck.image = UIImage(named: "red_check")
            confirmpasscheck.image = UIImage(named: "red_check")
        }
    }
    
    @IBAction func RegisterAction(_ sender: Any) {
        
        
        guard let email = emailTF.text, email.isNotEmpty ,let pass = passwordTF.text, pass.isNotEmpty else {
            SimpleAlert(title: "Error", msg: "Pls fill all fields")
            return }
        
        guard let confirmpass = confirmPassTF.text,confirmpass == pass else {
            SimpleAlert(title: "Error", msg: "Password & Confirm password should be same")
            return }
        self.activityIndicator.isHidden = false
        self.activityIndicator.startAnimating()
        
        
        guard let authuser = Auth.auth().currentUser else { return }
        
        let credential = EmailAuthProvider.credential(withEmail: email, password: pass)
        
        
        authuser.link(with: credential) { (authDataResult, error) in
            
            if let error = error
            {
                print(error.localizedDescription)
               Auth.auth().handlefireauthError(error: error,vc: self)
            }
            
            self.activityIndicator.stopAnimating()
            
            self.dismiss(animated: true, completion: nil)
            
        }
        
    }
    
    
}
