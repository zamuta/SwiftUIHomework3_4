//
//  NavigationStack.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

public struct NavigationStack {
    private var screens: [NavigationStackScreen] = []
    
    public mutating func push(_ s: NavigationStackScreen) {
        self.screens.append(s)
    }
    
    public mutating func pop() {
        _ = self.screens.popLast()
    }
    
    public func top() -> NavigationStackScreen? {
        return self.screens.last
    }
}
