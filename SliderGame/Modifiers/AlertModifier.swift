//
//  AlertModifier.swift
//  SliderGame
//
//  Created by Anastasya Maximova on 31.01.2025.
//

import SwiftUI

struct AlertModifier: ViewModifier {
    var score: Int
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .alert("Your Score", isPresented: $isPresented) {
                Button("OK") {
                    isPresented.toggle()
                }
            } message: {
                Text(score.formatted())
            }
    }
}

extension View {
    func alertAppearance (score: Int, isPresented: Binding<Bool>) -> some View {
        ModifiedContent(content: self, modifier: AlertModifier(score: score, isPresented: isPresented))
    }
}
