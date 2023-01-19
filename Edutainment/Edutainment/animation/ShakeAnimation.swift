//
//  ShakeAnimation.swift
//  Edutainment
//
//  Created by 최윤호 on 2023/01/19.
//
import SwiftUI

struct Shake : GeometryEffect {
    var amount : CGFloat = 10
    var shakesPerUnit = 3
    var animatableData: CGFloat = 1
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        ProjectionTransform(CGAffineTransform(translationX: amount * sin(animatableData * .pi * CGFloat(shakesPerUnit)), y: 0))
            
    }
}
