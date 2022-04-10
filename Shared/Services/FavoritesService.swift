//
//  FavoritesController.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import Foundation
import TheNewsAPI

class FavoritesService {
    private let kUserDefaultsFavoritesKey = "favorites"
    private var uuids: [String] = [] // Array для сохранения порядка добавления
    
    init() {
        uuids = UserDefaults.standard.object(forKey: kUserDefaultsFavoritesKey) as? [String] ?? []
    }
    
    func contains(_ newinfo: NewsInfo) -> Bool {
        uuids.contains(newinfo.uuid)
    }
    
    func add(_ newinfo: NewsInfo) {
        let index = uuids.firstIndex(of: newinfo.uuid)
        if (index == nil) {
            uuids.append(newinfo.uuid)
        }
        save()
    }
    
    func remove(_ newinfo: NewsInfo) {
        let index = uuids.firstIndex(of: newinfo.uuid)
        if (index != nil) {
            uuids.remove(at: index!)
        }
        save()
    }
    
    private func save() {
        UserDefaults.standard.set(uuids, forKey: kUserDefaultsFavoritesKey)
    }
}
