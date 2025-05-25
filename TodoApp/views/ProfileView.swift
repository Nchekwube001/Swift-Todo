//
//  ProfileView.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import SwiftUI


struct ProfileView:View {
    @StateObject var profileVM = ProfileViewVM()
    
    var body: some View {
        NavigationView{
            VStack{
                if let user = profileVM.user{
                    // Avatar
                     
                     Image(systemName: "person.circle")
                         .resizable()
                         .aspectRatio(contentMode: .fit)
                         .frame(width: 120, height: 120)
                         .padding(.top,36)
                     
                     VStack(alignment: .leading){
                         HStack(){
                             Text("Name:")
                                 .bold()
                             Text(user.name)
                         }.padding(.bottom,20)
                         HStack(){
                             Text("Email:")
                                 .bold()
                             Text(user.email)
                         }.padding(.bottom,20)
                         HStack(){
                             Text("Joined:")
                                 .bold()
                             Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                         }.padding(.bottom,20)
                     }.padding(.top,36)
                     
                     ButtonView(title: "Log Out", background: .red) {
                         profileVM.logout()
                     }.padding(.top,36)
                     
                     Spacer()
                }else{
                    Text("loading........")
                }
            }.padding(.horizontal,24)
            .navigationTitle("Profile")
        }.onAppear{
            profileVM.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}
