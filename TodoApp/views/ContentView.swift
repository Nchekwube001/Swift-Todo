//
//  ContentView.swift
//  TodoApp
//
//  Created by francis on 01/05/2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var contentViewModel = ContentViewVM(currentUserId: "", handler: nil)
    @ViewBuilder
    var accountView:some View {
        TabView{
            TodoListView(userId: contentViewModel.currentUserId)
                .tabItem(){
                    Label("Home", systemImage: "house")
                }
            ProfileView()
                .tabItem(){
                    Label("Profile", systemImage: "person.circle")
                }
        }
    }
    
    
    var body: some View {
        if contentViewModel.isSignedIn, !contentViewModel.currentUserId.isEmpty {
            accountView
        }else{
            LoginView()
        }
       
        
     
      
    }
}

#Preview {
    ContentView()
}
