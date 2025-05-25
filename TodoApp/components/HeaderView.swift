//
//  LoginHeaderView.swift
//  TodoApp
//
//  Created by francis on 25/05/2025.
//

import SwiftUI

struct HeaderView: View {
    let title:String;
    let subtitle:String;
    let angle:Double;
    let background:Color;
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            VStack{
                Text(title)
                    .foregroundColor(Color.white)
                    .font(.system(size: 48))
                    .bold()
                Text(subtitle)
                    .foregroundColor(Color.white)
                    .font(.system(size: 28))
            }
            .padding(.top,80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 350)
        .offset(y: -150)
    }
}

#Preview {
      HeaderView(title: "String", subtitle: "String", angle: 15, background: .black)
}
