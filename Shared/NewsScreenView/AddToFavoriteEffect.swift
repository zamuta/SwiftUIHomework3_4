//
//  AddToFavoriteEffect.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

struct AddToFavoriteEffect: GeometryEffect {
    var percent: CGFloat = 0
    
    var animatableData: CGFloat {
        get { percent }
        set { percent = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let screenSize = UIScreen.main.bounds.size
        let point: CGPoint = .init(x: screenSize.width * percent, y: 0)
        return ProjectionTransform(CGAffineTransform(translationX: point.x, y: point.y))
    }
}
