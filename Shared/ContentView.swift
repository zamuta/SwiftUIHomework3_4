//
//  ContentView.swift
//  Shared
//
//  Created by Mikhail Kanshin on 18.03.2022.
//

import SwiftUI
import HomeWorkUI

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
                }
                .tag(MainTab.ProductScreen)
                .environmentObject(MultipleNewsViewModel.init())
            FavoriteScreenView()
                .tabItem {
                    Image(systemName: "star")
                }
                .tag(MainTab.CartScreen)
        }
        .environmentObject(FavoritesViewModel.init())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
