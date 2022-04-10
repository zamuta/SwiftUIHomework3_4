//
//  NavigationStack.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

struct NavigationStack {
    private var screens: [NavigationStackScreen] = []
    
    mutating func push(_ s: NavigationStackScreen) {
        self.screens.append(s)
    }
    
    mutating func pop() {
        _ = self.screens.popLast()
    }
    
    func top()->NavigationStackScreen? {
        return self.screens.last
    }
}
