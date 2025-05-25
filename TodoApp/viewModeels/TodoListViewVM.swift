//
//  TodoListViewVM.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import Foundation
import FirebaseFirestore

class TodoListViewVM:ObservableObject{
    @Published var showingNewItemView = false
    private let userId:String
    init(userId:String){
        self.userId = userId
    }
    
    func deleteItem (id:String){
        let db  = Firestore.firestore()
        
        print(userId,id)
//        DispatchQueue.main.async {
            
            db
                .collection("users")
                .document(self.userId)
                .collection("todos")
                .document(id)
                .delete { error in
                    if let error = error {
                        print("🔥 Error deleting document: \(error.localizedDescription)")
                        // Optionally: show alert or log to Crashlytics
                    } else {
                        print("✅ Document successfully deleted!")
                    }
                }
            
//        }
    }
}
