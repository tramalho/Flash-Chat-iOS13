//
//  ChatViewController.swift
//  Flash Chat iOS13
//
//  Created by Angela Yu on 21/10/2019.
//  Copyright © 2019 Angela Yu. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController, Credential {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextfield: UITextField!
    
    private let messages = [
        Message(sender: "a1@b.com", body: "Hey!"),
        Message(sender: "a@b.com", body: "Hello"),
        Message(sender: "a1@b.com", body: "Hey! Hello and What up? Hey! Hello and What up?"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        logout()
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        
        if let cell = cell as? MessageTableViewCell {
        
            let message = messages[indexPath.row]
    
            cell.messageLabel.text = message.body
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
}
