//
//  FavoritesController.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import Foundation
import TheNewsAPI

public class FavoritesService {
    static public let shared = FavoritesService()
    
    private let kUserDefaultsFavoritesKey = "favorites"
    private var uuids: [String] = [] // Array для сохранения порядка добавления
    
    public init() {
        uuids = UserDefaults.standard.object(forKey: kUserDefaultsFavoritesKey) as? [String] ?? []
    }
    
    public func contains(_ newinfo: NewsInfo) -> Bool {
        uuids.contains(newinfo.uuid)
    }
    
    public func add(_ newinfo: NewsInfo) {
        let index = uuids.firstIndex(of: newinfo.uuid)
        if (index == nil) {
            uuids.append(newinfo.uuid)
        }
        save()
    }
    
    public func remove(_ newinfo: NewsInfo) {
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
