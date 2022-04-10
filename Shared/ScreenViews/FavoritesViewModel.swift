//
//  FavoritesViewModel.swift
//  SwiftUIHomework (iOS)
//
//  Created by Mikhail Kanshin on 10.04.2022.
//

import SwiftUI
import TheNewsAPI
import HomeWorkServices

class FavoritesViewModel: ObservableObject {
    @InjectedService var favoritesService: FavoritesService
    
    func contains(_ newinfo: NewsInfo) -> Bool {
        favoritesService.contains(newinfo)
    }
    
    func add(_ newinfo: NewsInfo) {
        objectWillChange.send()
        favoritesService.add(newinfo)
    }
    
    func remove(_ newinfo: NewsInfo) {
        objectWillChange.send()
        favoritesService.remove(newinfo)
    }
}
