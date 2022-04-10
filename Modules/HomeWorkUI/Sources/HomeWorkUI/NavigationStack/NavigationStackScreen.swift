//
//  NavigationStackScreen.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

public struct NavigationStackScreen: Identifiable, Equatable {
    public let id = UUID().uuidString
    public let view: AnyView
    
    public static func == (lhs: NavigationStackScreen, rhs: NavigationStackScreen)-> Bool {
        return lhs.id == rhs.id
    }
}
