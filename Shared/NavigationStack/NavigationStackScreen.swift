//
//  NavigationStackScreen.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

struct NavigationStackScreen: Identifiable, Equatable {
    let id = UUID().uuidString
    let view: AnyView
    
    public static func == (lhs: NavigationStackScreen, rhs: NavigationStackScreen)-> Bool {
        return lhs.id == rhs.id
    }
}
