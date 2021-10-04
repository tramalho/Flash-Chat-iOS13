//
//  Firestore+UIViewController.swift
//  Flash Chat iOS13
//
//  Created by Thiago Antonio Ramalho on 02/10/21.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import Firebase

protocol Persistence: UIViewController {
    func resultData(messages: [Message])
}

extension Persistence {
        
    func persist(message: String) {
        
        if let email = currentUser() {
            
            let data: [String : Any] = [K.FStore.senderField:email, K.FStore.bodyField: message, K.FStore.dateField: Date().timeIntervalSince1970]
            
            dbCollection().addDocument(data: data) { error in
               
                if let error = error {
                    self.showDialog(message: error.localizedDescription)
                }
            }
            
        } else {
            showDialog(message: K.errorSendMessage)
        }
    }
    
    func retrieve() {
        
        dbCollection().order(by: K.FStore.dateField).addSnapshotListener { querySnapshot, error in
            
            var messages: [Message] = []
            
            if let error = error {
                self.showDialog(message: error.localizedDescription)
            } else {
            
                for document in querySnapshot!.documents {
                    let data = document.data()
                    
                    let obj = Message(sender: data[K.FStore.senderField] as! String, body: data[K.FStore.bodyField] as! String)
                    
                    messages.append(obj)
                }
            }
            
            self.resultData(messages: messages)
        }
    }
    
    public func isCurrentUser(user: String) -> Bool {
        return currentUser() == user
    }
    
    private func dbCollection() -> CollectionReference {
        return Firestore.firestore().collection(K.FStore.collectionName)
    }
    
    private func currentUser() -> String? {
        return Auth.auth().currentUser?.email
    }
}
