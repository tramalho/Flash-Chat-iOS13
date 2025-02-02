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
        
    override func viewDidLoad() {
        super.viewDidLoad()

        animateLogo()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
    private func animateLogo() {
        self.titleLabel.text = ""
        for (index, value) in K.appName.enumerated() {
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(index), repeats: false) { timer in
                self.titleLabel.text?.append(value)
            }
        }
    }

}
