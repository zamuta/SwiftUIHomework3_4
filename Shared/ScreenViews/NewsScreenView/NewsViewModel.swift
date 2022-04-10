//
//  NewsViewModel.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import Foundation
import HomeWorkServices
import TheNewsAPI
import Combine

final class NewsViewModel: ObservableObject {
    @InjectedService private var api: NewsAPI.Type
    private var subscriptions: Set<AnyCancellable> = .init()
    
    // itV4cbFUXsuNfzGubDIN2nGnaOPFxs6H0Pl0Cxc0
    // zoF0vLrnZn9v8owS6Ev4xxsOUUG4SWMA62JZvGbG
    // jHOR9GuzkO8cghjEDTHtQGddUhJL9FvMYDx8Gx3s
    private let apiToken = "itV4cbFUXsuNfzGubDIN2nGnaOPFxs6H0Pl0Cxc0"
    
    public private(set) var isLoading: Bool = false
    public private(set) var page: Int = 0
    public private(set) var total: Int = .max
    
    private let query: String
    @Published private(set) var news: [NewsInfo] = []
    
    init(query: String) {
        self.query = query
    }
    
    func fetchNext() {
        guard isLoading == false else {
            return
        }
        guard total > news.count else {
            return
        }
        isLoading = true
        // В бесплатной версии апишки ограничение на limit 5
        let promise = api.deferred_newsAllGet(apiToken:apiToken, limit: 5, page: page + 1, search: query, language: "en")
        promise.sink { [weak self] completion in
            guard let self = self else { return }
            self.isLoading = false
        } receiveValue: { [weak self] response in
            guard let self = self else { return }
            let meta = response.meta
            let news = response.data
            self.page = meta!.page
            self.total = meta!.found
            self.news.append(contentsOf: (news ?? []))
        }.store(in: &subscriptions)
    }
}
