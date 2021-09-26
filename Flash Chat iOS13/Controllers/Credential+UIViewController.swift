//
//  Credentials.swift
//  Flash Chat iOS13
//
//  Created by Thiago Antonio Ramalho on 25/09/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit
import Firebase

protocol Credential: UIViewController { }

extension Credential {
    
    func register(emailTextfield: String?, passwordTextfield: String?) {
        authenticate(emailTextfield: emailTextfield, passwordTextfield: passwordTextfield, isLogin: false)
    }
    
    func login(emailTextfield: String?, passwordTextfield: String?) {
        authenticate(emailTextfield: emailTextfield, passwordTextfield: passwordTextfield, isLogin: true)
    }
    
    fileprivate func authenticate(emailTextfield: String?, passwordTextfield: String?, isLogin: Bool) {
        
        if let email = emailTextfield, !email.isEmpty, let password = passwordTextfield, !password.isEmpty {
            
            if isLogin {
                Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                    self?.performOrError(error, identifier: "loginToChat")
                }
            } else {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                    self.performOrError(error, identifier: "registerToChat")
                }
            }
             
         } else {
            showDialog(message: "Invalid email or password")
         }
    }
    
    fileprivate func performOrError(_ error: Error?, identifier: String) {
        if let error = error {
            self.showDialog(message: error.localizedDescription)
        } else {
            self.performSegue(withIdentifier: identifier, sender: self)
        }
    }
}
