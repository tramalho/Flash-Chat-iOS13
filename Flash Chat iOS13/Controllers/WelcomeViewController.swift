//
//  WelcomeViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    private let animationMessage = "⚡️FlashChat"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        animateLogo()
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        
    }
    private func animateLogo() {
        self.titleLabel.text = ""
        for (index, value) in animationMessage.enumerated() {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(index), repeats: false) { timer in
                self.titleLabel.text?.append(value)
            }
        }
    }
}
