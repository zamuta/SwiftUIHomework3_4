//
//  SwiftUIHomeworkApp.swift
//  Shared
//
//  Created by Mikhail Kanshin on 18.03.2022.
//

import SwiftUI
import HomeWorkServices

@main
struct SwiftUIHomeworkApp: App {
    init() {
        ServiceLocator.shared.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
