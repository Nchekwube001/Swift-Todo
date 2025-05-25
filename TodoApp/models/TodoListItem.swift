//
//  TodoListItem.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import Foundation


struct TodoListItem:Codable,Identifiable{
    let id:String
    let title:String
    var isDone:Bool
    let createdDate:TimeInterval
    let dueDate:TimeInterval
    
    
    mutating func setDone(_ done:Bool){
        isDone = done
    }
}
