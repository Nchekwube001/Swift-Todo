//
//  NewItemViewVM.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import Foundation
import FirebaseFirestore
import FirebaseAuth


class NewItemViewVM:ObservableObject{
    @Published var title:String = "";
    @Published var showAlert:Bool = false;
    @Published var dueDate:Date = Date();
    init(){
        
    }
    
    func save(){
        guard canSave else{
            return
        }
        
        // Get current user id
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        // Create model
        let newId = UUID().uuidString
        let newItem = TodoListItem(
            id: newId,
            title: title,
            isDone: false,
            createdDate: dueDate.timeIntervalSince1970,
            dueDate: Date().timeIntervalSince1970)
        // save model
        print(uid)
        print(newItem)
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary())


    }
    
    var canSave:Bool{
        
        guard !title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else{
            return false
        }
        
        return true
    }
}
