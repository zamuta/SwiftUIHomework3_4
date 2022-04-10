//
//  ContentView.swift
//  Shared
//
//  Created by Mikhail Kanshin on 18.03.2022.
//

import SwiftUI

enum MainTab {
    case ProductScreen, CartScreen
}

struct ContentView: View {
    @State var selectedTab = MainTab.ProductScreen
    
    var body: some View {
        TabView(selection: $selectedTab) {
            NavigationStackContainerView(transition: NavigationStackTransition.custom(.slide), content: {NewsScreenView()})
                .tabItem {
                    Image(systemName: "doc")
                }.tag(MainTab.ProductScreen)
            FavoriteScreenView()
                .tabItem {
                    Image(systemName: "star")
                }.tag(MainTab.CartScreen)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
