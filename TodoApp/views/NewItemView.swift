//
//  NewItemView.swift
//  TodoApp
//
//  Created by francis on 24/05/2025.
//

import SwiftUI

struct NewItemView:View {
    @StateObject var newItemVM = NewItemViewVM()
    @Binding var newItemPresented:Bool
    var body: some View {
        VStack{
            Text("New Item")
                .bold()
                .font(.system(size: 32))
                .padding(.top,50)
            
            Form{
                TextField("Title",text: $newItemVM.title)
                
                DatePicker("Due Date", selection: $newItemVM.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                ButtonView(title: "Save", background: .black) {
                 
                    if newItemVM.canSave {
                        newItemVM.save()
                        newItemPresented = false
                    } else{
                        newItemVM.showAlert = true
                    }
                  
                }.padding()
            }
            .alert(
                "Error",
                isPresented: $newItemVM.showAlert
               ) {
                   ButtonView(title: "Close", background: .red) {
                       newItemVM.showAlert = false
                   }
                  
               } message: {
                   Text("Please fill in all fields and select a valid date")
               }
//            .alert(isPresented:$newItemVM.showAlert){
//                Alert(title:Text( "Error"), message: Text("Please fill in all fields and select a valid date"))
//            }
           
        }
     

    }
    
    
}

#Preview {
    NewItemView(newItemPresented:Binding(get: {
        return true
    }, set: { _  in
        
    }))
}
