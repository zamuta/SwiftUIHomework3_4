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
    
//    func percentPoint(_ percent: CGFloat) -> CGPoint {
//        // percent difference between points
//        let diff: CGFloat = 0.001
//        let comp: CGFloat = 1 - diff
//
//        // handle limits
//        let pct = percent > 1 ? 0 : (percent < 0 ? 1 : percent)
//
//        let f = pct > comp ? comp : pct
//        let t = pct > comp ? 1 : pct + diff
//        let tp = path.trimmedPath(from: f, to: t)
//
//        return CGPoint(x: tp.boundingRect.midX, y: tp.boundingRect.midY)
//    }
}
