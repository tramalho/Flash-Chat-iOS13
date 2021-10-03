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
    
    private var finalMessages:[Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        title = K.appName
        navigationItem.hidesBackButton = true
        tableView.register(UINib(nibName: K.cellNibName, bundle: nil), forCellReuseIdentifier: K.cellIdentifier)
        
        retrieve()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let message = messageTextfield.text {
            persist(message: message)
        } 
    }
    
    @IBAction func logoutPressed(_ sender: UIBarButtonItem) {
        logout()
    }
}

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        
        if let cell = cell as? MessageTableViewCell {
        
            let message = finalMessages[indexPath.row]
    
            cell.messageLabel.text = message.body
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return finalMessages.count
    }
}

extension ChatViewController: Persistence {
    
    func resultData(messages: [Message]) {
        DispatchQueue.main.async {
            self.finalMessages = messages
            self.tableView.reloadData()
        }
    }
}
