//
//  ButtonView.swift
//  SliderGame
//
//  Created by Anastasya Maximova on 31.01.2025.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    let score = 1
    let isPresented = true
    var body: some View {
        Button(action: action){
            Text(title)
                .font(.system(size: 22))
                .alertAppearance(value: score, isPresented: isPresented)
        }
        
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View{
        ButtonView(title: "Title", action: {})
    }
}
