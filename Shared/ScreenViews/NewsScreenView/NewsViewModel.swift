//
//  NewsViewModel.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import Foundation
import TheNewsAPI

enum NewsType {
    case TeslaNews, IntelNews
}

final class NewsViewModel: ObservableObject {
    @InjectedService private var api: NewsAPI.Type
    
    // itV4cbFUXsuNfzGubDIN2nGnaOPFxs6H0Pl0Cxc0
    // zoF0vLrnZn9v8owS6Ev4xxsOUUG4SWMA62JZvGbG
    // jHOR9GuzkO8cghjEDTHtQGddUhJL9FvMYDx8Gx3s
    private let apiToken = "itV4cbFUXsuNfzGubDIN2nGnaOPFxs6H0Pl0Cxc0"
    
    public private(set) var isLoading: Bool = false
    public private(set) var page: Int = 0
    public private(set) var total: Int = .max
    
    private var newsType: NewsType = .TeslaNews
    @Published private(set) var news: [NewsInfo] = []
    
    init(newsType: NewsType) {
        self.newsType = newsType
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
        let search = newsType == .TeslaNews ? "tesla" : "intel"
        api.newsAllGet(apiToken:apiToken, limit: 5, page: page + 1, search: search, language: "en") { [weak self] data, error in
            guard let self = self else { return }
            if(error == nil) {
                let meta = data?.meta
                let news = data?.data
                self.page = meta!.page
                self.total = meta!.found
                self.news.append(contentsOf: (news ?? []))
            }
            self.isLoading = false
        }
    }
}
