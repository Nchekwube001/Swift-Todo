//
//  ContentViewVM.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import Foundation
import FirebaseAuth

class ContentViewVM:ObservableObject{
    @Published var currentUserId : String
    private var handler : AuthStateDidChangeListenerHandle?
    
    init(currentUserId: String, handler: AuthStateDidChangeListenerHandle? = nil) {
        self.currentUserId = currentUserId
 
        self.handler = Auth.auth().addStateDidChangeListener{ [weak self] _,user in
            DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn : Bool{
        return Auth.auth().currentUser != nil
    }
}
