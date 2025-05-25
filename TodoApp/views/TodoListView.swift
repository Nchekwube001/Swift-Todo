//
//  TodoListVCiew.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import SwiftUI
import FirebaseFirestore
struct TodoListView:View {
    
    @StateObject var todoListViewModel : TodoListViewVM
    @FirestoreQuery var items : [TodoListItem]
   
    
    init(userId:String){
      
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._todoListViewModel = StateObject(wrappedValue: TodoListViewVM(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){ item in
                    
                    ItemView(item: item)
                        .swipeActions {
                            Button("Delete"){
                                todoListViewModel.deleteItem(id: item.id)
                            }.tint(.red)
                        }
                    
                }.listStyle(PlainListStyle())
            }
            .navigationTitle("Todo App")
            .toolbar {
                Button{
                    todoListViewModel.showingNewItemView = true
                }label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $todoListViewModel.showingNewItemView) {
                NewItemView(newItemPresented: $todoListViewModel.showingNewItemView)
            }
        }
    }
}


#Preview {
    TodoListView(userId: "zUZvgiNhJDXjfAYCOlznbQRsDHI3")
}
