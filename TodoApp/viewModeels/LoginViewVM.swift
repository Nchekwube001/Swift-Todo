//
//  LoginViewVM.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import Foundation
import FirebaseAuth

class LoginViewVM:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {
    
    }
    
    func login(){
      
        guard validate() else{
            return
        }
        
        
        Auth.auth().signIn(withEmail: email, password: password)
        
    }
    
    private func validate()-> Bool{
       errorMessage = ""
       guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
           errorMessage = "Please fill in all fields"
           return false
       }
       guard email.contains("@") && email.contains(".") else{
           errorMessage = "Please enter a valid email address."
           return false
       }
  
      return true
    }
}
