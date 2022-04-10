//
//  InjectedService.swift
//  SwiftUIHomework (iOS)
//
//  Created by Mikhail Kanshin on 10.04.2022.
//

import Foundation

@propertyWrapper
struct InjectedService<T> {
    private var service: T?

    var wrappedValue: T {
        mutating get {
            if service == nil {
                service = ServiceLocator.shared.getService(T.self)
                if service == nil {
                    fatalError("Service not found")
                }
            }
            return service!
        }
    }
}
