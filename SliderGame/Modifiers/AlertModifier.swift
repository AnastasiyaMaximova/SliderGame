//
//  AlertModifier.swift
//  SliderGame
//
//  Created by Anastasya Maximova on 31.01.2025.
//

import SwiftUI

struct AlertModifier: ViewModifier {
    @Binding var value: Int
    @Binding var isPresented: Bool
    
    func body(content: Content) -> some View {
        content
            .alert("Your Score", isPresented: $isPresented) {
                Button("OK") {}
            } message: {
                Text(value.formatted())
            }
    }
       
}

extension View {
    func alertAppearance (value: Int, isPresented: Bool) -> some View {
        ModifiedContent(content: self, modifier: AlertModifier(value: .constant(200), isPresented: .constant(true)))
    }
}
