//
//  RegisterViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, !email.isEmpty,  let password = passwordTextfield.text, !password.isEmpty {
             Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let error = error {
                    self.showDialog(message: error.localizedDescription)
                } else {
                    self.performSegue(withIdentifier: "registerToChat", sender: self)
                }
             }
         } else {
            showDialog(message: "Invalid email or password")
         }
    }
    
}
