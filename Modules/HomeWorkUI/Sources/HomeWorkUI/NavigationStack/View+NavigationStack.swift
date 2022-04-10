//
//  View+NavigationStack.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

extension View {
    public func toAnyView() -> AnyView {
        AnyView(self)
    }
}
