//
//  ServiceLocator+Configurator.swift
//  SwiftUIHomework (iOS)
//
//  Created by Mikhail Kanshin on 10.04.2022.
//

import Foundation
import TheNewsAPI

extension ServiceLocator {
    func configure() {
        self.addService(service: NewsAPI.self)
        self.addService(service: FavoritesService())
    }
}
