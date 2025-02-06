//
//  ContentViewModel.swift
//  SliderGame
//
//  Created by Anastasya Maximova on 31.01.2025.
//

import Foundation
import Observation

@Observable final class ContentViewViewModel {
    
    var targetValue = Int.random(in: 1...100)
    var currentValue = 55.0
    var isPresented = false
    var score: Int {
        100 - abs(targetValue - lround(currentValue))
    }
    var alphaOfThumb: CGFloat {
        CGFloat(score)/100
    }
    
    func updateTargetValue(){
        targetValue = Int.random(in: 1...100)
    }
    
    func buttonAction() {
        isPresented.toggle()
    }
}

