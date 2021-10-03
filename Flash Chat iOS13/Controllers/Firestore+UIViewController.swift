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
        
        if let email = Auth.auth().currentUser?.email {
            
            let data = [K.FStore.senderField:email, K.FStore.bodyField: message]
            
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
        
        var messages: [Message] = []
        
        dbCollection().getDocuments { querySnapshot, error in
            
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
    
    private func dbCollection() -> CollectionReference {
        return Firestore.firestore().collection(K.FStore.collectionName)
    }
}
