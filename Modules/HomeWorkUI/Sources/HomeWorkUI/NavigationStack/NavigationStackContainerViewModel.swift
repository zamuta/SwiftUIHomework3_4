//
//  NavigationStackContainerViewModel.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

public enum NavigationStackTransition {
    case none
    case custom(AnyTransition)
}

public enum NavigationStackNavigationType {
    case pop
    case push
}

public class NavigationContainerViewModel : ObservableObject {
    @Published var currentScreen: NavigationStackScreen?
    public var navigationType: NavigationStackNavigationType = .push
    
    public var screenStack = NavigationStack() {
        didSet {
            self.currentScreen = screenStack.top()
        }
    }
    
    public func push(screenView: AnyView) {
        self.navigationType = .push
        let screen = NavigationStackScreen(view: screenView)
        screenStack.push(screen)
    }
    
    public func pop() {
        self.navigationType = .pop
        screenStack.pop()
    }
}
