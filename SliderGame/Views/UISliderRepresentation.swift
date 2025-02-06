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
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didSliderSlide),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.setThumbImage(
            createThumbImage(
                size: CGSize(width: 35, height: 35),
                color: .red,
                alpha: alpha
            ),
            for: .normal
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value, alpha: $alpha, action: {})
    }
    
    private func createThumbImage(size: CGSize, color: UIColor, alpha: CGFloat) -> UIImage {
        let render = UIGraphicsImageRenderer(size: size)
        return render.image { context in
            color.withAlphaComponent(alpha).setFill()
            let path = UIBezierPath(ovalIn: CGRect(origin: .zero, size: size))
            path.fill()
        }
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
        
        @objc func didSliderSlide(_ sender: UISlider) {
            value = Double(sender.value)
            alpha = sender.alpha
            action()
        }
    }
}

#Preview {
    UISliderRepresentation(value: .constant(60.0), alpha: .constant(0.5))
}
