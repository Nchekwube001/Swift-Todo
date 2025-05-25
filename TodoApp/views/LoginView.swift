//
//  LoginView.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import SwiftUI

struct LoginView: View {
    @StateObject  var loginViewModel = LoginViewVM()
    var body: some View {
        NavigationView{
            VStack{
                //Header
                HeaderView(title:"Todo List", subtitle: "Get Organized",angle: 15,background: .black)
                
           
                //Login form
                Form{
                    
                    if(!loginViewModel.errorMessage.isEmpty) {
                        Text(loginViewModel.errorMessage).foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $loginViewModel.email)

                    SecureField("Password", text: $loginViewModel.password)

                    
                    HStack{
                        
                        
                        ButtonView(title: "Login", background: .black) {
                            loginViewModel.login()
                        }
                    }.padding(.top,24)
                }.offset(y:-50)
                
                
                //Create Account
                VStack{
                    Text("New here?")
                    NavigationLink("Create Account",destination: RegisterView())
                }.padding(.bottom,50)
                Spacer()
            }
        }
    }
}


#Preview {
    LoginView()
}
