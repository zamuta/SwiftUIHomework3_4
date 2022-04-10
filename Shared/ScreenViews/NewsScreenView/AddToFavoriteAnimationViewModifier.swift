//
//  TopAnimationViewM.swift
//  SwiftUIHomework (iOS)
//
//  Created by Mikhail Kanshin on 10.04.2022.
//

import SwiftUI

struct AddToFavoriteAnimationViewModifier: ViewModifier {
    var animationPercent: CGFloat = 0
    var animationEnabled: Bool = false
    
    func body(content: Content) -> some View {
        ZStack {
            content
            if animationEnabled {
                content.modifier(AddToFavoriteEffectV2(percent: animationPercent))
            }
        }
    }
}
