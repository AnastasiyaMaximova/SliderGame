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
    var score: Int
    @Binding var isPresented: Bool
    
    var body: some View {
        Button(action: action){
            Text(title)
                .font(.system(size: 22))
                .alertAppearance(score: score, isPresented: $isPresented)
        }
    }
}

struct ActionButtonView_Previews: PreviewProvider {
    static var previews: some View{
        ButtonView(title: "Title", action: {}, score: 100, isPresented: .constant(true))
    }
}
