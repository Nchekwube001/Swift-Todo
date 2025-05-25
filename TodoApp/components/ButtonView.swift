//
//  ButtonView.swift
//  TodoApp
//
//  Created by francis on 25/05/2025.
//

import SwiftUI

struct ButtonView: View {
    let title:String;
    let background:Color;
    let action: ()-> Void
    var body: some View {
        Button{
            // Action
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(background)
                    .frame(height: 50)
                
                Text(title)
                    .foregroundColor(.white)
            }
        }
    }
}

#Preview {
    ButtonView(title: "TItle", background: .black) {
        
    }
}
