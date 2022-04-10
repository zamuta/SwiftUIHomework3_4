//
//  NavigationStackContainerViewModel.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

enum NavigationStackTransition {
    case none
    case custom(AnyTransition)
}

enum NavigationStackNavigationType {
    case pop
    case push
}

class NavigationContainerViewModel : ObservableObject {
    @Published var currentScreen: NavigationStackScreen?
    var navigationType: NavigationStackNavigationType = .push
    
    var screenStack = NavigationStack() {
        didSet {
            self.currentScreen = screenStack.top()
        }
    }
    
    func push(screenView: AnyView) {
        self.navigationType = .push
        let screen = NavigationStackScreen(view: screenView)
        screenStack.push(screen)
    }
    
    func pop() {
        self.navigationType = .pop
        screenStack.pop()
    }
}
