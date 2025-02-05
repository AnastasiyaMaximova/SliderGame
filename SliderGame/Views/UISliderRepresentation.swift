//
//  UISliderRepresentation.swift
//  SliderGame
//
//  Created by Anastasya Maximova on 03.02.2025.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable{
    
    @Binding var value: Double
    @Binding var alpha: CGFloat
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        // slider.value = value
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.minimumTrackTintColor = .blue
        slider.thumbTintColor = .red
        slider.thumbTintColor?.withAlphaComponent(alpha)
        slider.setValue(Float(value), animated: true)
    return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, alpha: $alpha, action: {})
        
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        @Binding var value: Double
        @Binding var alpha: CGFloat
        
        let action: () -> Void
        
        init(value: Binding<Double>, alpha: Binding<CGFloat>, action: @escaping () -> Void) {
            self._value = value
            self._alpha = alpha
            self.action = action
        }
        
//        @objc func didTapDone(_ sender: UITextField) {
//            text = sender.text ?? ""
//            withAnimation {
//                action()
//            }
//        }
    }
}

#Preview {
    UISliderRepresentation(value: .constant(59.0), alpha: .constant(0.9))
}
