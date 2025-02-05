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
    var currentValue = 50.0
    var alphaOfThumb: CGFloat {
        CGFloat(computerScore())
    }
    
    func updateTargetValue(){
        targetValue = Int.random(in: 1...100)
    }
    
    private func computerScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
    
}

