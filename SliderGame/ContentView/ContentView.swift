//
//  ContentView.swift
//  SliderGame
//
//  Created by Anastasya Maximova on 31.01.2025.
//

import SwiftUI

struct ContentView: View {
    private let contentViewVM = ContentViewViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Text("Подвиньте слайдер, как можно ближе к: \(contentViewVM.targetValue.formatted())")
            }
            .padding(.bottom, 20)
            HStack {
                Text("0")
                UISliderRepresentation(
                    value: .constant(contentViewVM.currentValue),
                    alpha: .constant(contentViewVM.alphaOfThumb)
                )
                Text("100")
            }
                .padding(.bottom, 40)
            
            ButtonView(title: "Проверь меня!", action: {})
                .padding(.bottom, 20)
            ButtonView(title: "Начать заново", action: contentViewVM.updateTargetValue)
        }
        .padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
