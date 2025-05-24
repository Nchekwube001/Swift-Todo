//
//  TodoAppApp.swift
//  TodoApp
//
//  Created by francis on 01/05/2025.
//

import SwiftUI
import FirebaseCore
@main
struct TodoAppApp: App {
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
