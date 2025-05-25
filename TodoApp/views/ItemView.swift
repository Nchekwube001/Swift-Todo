//
//  ItemView.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import SwiftUI

struct ItemView: View {
    let item: TodoListItem
    @StateObject var itemViewModel = ItemViewVM()
    var body: some View {
        HStack{
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.title)
                   
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
            }
            Spacer()
            
            Button{
                itemViewModel.toggleIsDone(item:item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill":"circle")
            }
        }
    }
}

#Preview {
    ItemView(item: .init(id: "33eidjd", title: "Walk the dog", isDone: true, createdDate: Date().timeIntervalSince1970, dueDate: Date().timeIntervalSince1970))
}
