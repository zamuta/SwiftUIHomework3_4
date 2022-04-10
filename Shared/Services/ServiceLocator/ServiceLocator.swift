//
//  ServiceLocator.swift
//  SwiftUIHomework (iOS)
//
//  Created by Mikhail Kanshin on 10.04.2022.
//

import Foundation

class ServiceLocator {
    static let shared = ServiceLocator()
    
    private var services: [String: AnyObject] = [:]
    
    func addService<T>(service: T) {
        let key = "\(T.self)"
        if services[key] == nil {
            services[key] = service as AnyObject
        }
    }
    
    func getService<T>(_ type: T.Type) -> T? {
        let key = "\(T.self)"
        return services[key] as? T
    }
}
