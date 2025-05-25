//
//  RegisterViewVM.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//
import FirebaseFirestore
import Foundation
import FirebaseAuth

class RegisterViewVM:ObservableObject{
    @Published var email = ""
    @Published var password = ""
    @Published var name = ""
    @Published var errorMessage = ""
    init(){
        
    }
    
    func registerUser (){
        guard validate()else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password){[weak self] result,error in
            guard let userId = result?.user.uid else{
                self?.errorMessage = "An error occurred while creating user."
                return
            }
            
            self?.insertUserId(id: userId)
        }
    }
    
    
    private func insertUserId (id:String){
        let newUser = User(id: id, name: name, email: email, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func validate()->Bool{
        
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty, !password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty , !name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            errorMessage = "Please fill in all fields"
            return false
        }
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Please enter a valid email address."
            return false
        }
        guard password.count >= 6 else{
            errorMessage = "Password should be at least 6 digits"
            return false
        }
   
       return true
    }
}
