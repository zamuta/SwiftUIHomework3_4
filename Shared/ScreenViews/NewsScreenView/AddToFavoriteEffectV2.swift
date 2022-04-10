//
//  AddToFavoriteEffect2.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 03.04.2022.
//

import SwiftUI

struct AddToFavoriteEffectV2: GeometryEffect {
    var percent: CGFloat = 0
    
    var animatableData: CGFloat {
        get { percent }
        set { percent = newValue }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        let screenSize = UIScreen.main.bounds.size
        let transform = CGAffineTransform.identity
            .translatedBy(x: screenSize.width * percent, y: 200 * percent)
            .scaledBy(x: max(1 - percent, 0.2), y: max(1 - percent, 0.2))
        return ProjectionTransform(transform)
    }
}
