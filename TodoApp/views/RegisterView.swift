//
//  RegisterView.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import SwiftUI

struct RegisterView:View {
    @StateObject var registerViewModel = RegisterViewVM()
    var body: some View {
        VStack{
            HeaderView(title: "Welcome", subtitle: "Get Organized", angle: -15, background: .black)
            //Register form
            Form{
                TextField("Full Name", text: $registerViewModel.name)
                TextField("Email Address", text: $registerViewModel.email)

                SecureField("Password", text: $registerViewModel.password)

                
                HStack{
                    
                    
                    
                    ButtonView(title: "Register", background: .black) {
                        registerViewModel.registerUser()
                    }
                }.padding(.top,24)
            }.offset(y:-50)
            Spacer()
        }
    }
    
}

#Preview {
    RegisterView()
}
