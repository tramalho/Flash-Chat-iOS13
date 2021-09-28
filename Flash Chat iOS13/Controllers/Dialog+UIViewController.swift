//
//  Dialog+ViewController.swift
//  Flash Chat iOS13
//
//  Created by Thiago Antonio Ramalho on 25/09/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    func showDialog(message: String) {
        let alert = UIAlertController(title: K.dialogTitle, message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: K.Ok, style: UIAlertAction.Style.default, handler: nil))
        
        self.present(alert, animated: true, completion: nil)
    }
    
}
