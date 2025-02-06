//
//  ContentView.swift
//  SliderGame
//
//  Created by Anastasya Maximova on 31.01.2025.
//

import SwiftUI

struct ContentView: View {
    private var contentViewVM = ContentViewViewModel()
    
    private var currentValueBinding: Binding<Double> {
        Binding(
            get: {contentViewVM.currentValue},
            set: { contentViewVM.currentValue = $0}
            )
    }
    
    private var alphaOfThumbBinding: Binding<CGFloat> {
        Binding(
            get: {contentViewVM.alphaOfThumb},
            set: {_ in }
        )
    }
    
    private var isPresentedBinding: Binding<Bool> {
        Binding(
            get: {contentViewVM.isPresented},
            set: {contentViewVM.isPresented = $0}
        )
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("Подвиньте слайдер, как можно ближе к: \(contentViewVM.targetValue.formatted())")
            }
            .padding(.bottom, 20)
            
            HStack {
                Text("0")
                UISliderRepresentation(
                    value: currentValueBinding,
                    alpha: alphaOfThumbBinding
                )
                Text("100")
            }
                .padding(.bottom, 40)
            
            ButtonView(
                title: "Проверь меня!",
                action: contentViewVM.buttonAction,
                score: contentViewVM.score,
                isPresented: isPresentedBinding
            )
                .padding(.bottom, 20)
            
            ButtonView(
                title: "Начать заново",
                action: contentViewVM.updateTargetValue,
                score: 0,
                isPresented: .constant(false)
            )
        }
        .padding()
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
