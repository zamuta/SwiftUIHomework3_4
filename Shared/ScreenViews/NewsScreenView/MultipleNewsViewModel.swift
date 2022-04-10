//
//  NnewsViewModels2.swift
//  SwiftUIHomework (iOS)
//
//  Created by Mikhail Kanshin on 10.04.2022.
//

import Foundation

enum NewsType {
    case TeslaNews, IntelNews
}

final class MultipleNewsViewModel: ObservableObject {
    private let newsViewModels: [NewsType : NewsViewModel] = [.TeslaNews : .init(query: "tesla"),
                                                              .IntelNews : .init(query: "intel")]

    func newsViewModel(_ forType: NewsType) -> NewsViewModel {
        return newsViewModels[forType]!
    }
}
