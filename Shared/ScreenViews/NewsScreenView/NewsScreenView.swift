//
//  NewsScreenView.swift
//  SwiftUIHomework2
//
//  Created by Mikhail Kanshin on 18.03.2022.
//

import SwiftUI

struct NewsScreenView: View {
    private let newsViewModels: [NewsType : NewsViewModel] = [.TeslaNews : .init(newsType: .TeslaNews),
                                                              .IntelNews : .init(newsType: .IntelNews)]
    @State private var selectedNewsType: NewsType = .TeslaNews
    @StateObject private var favorites: FavoritesViewModel = .init()
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    var body: some View {
        VStack {
            Picker("Lists", selection: $selectedNewsType) {
                Text("Tesla").tag(NewsType.TeslaNews)
                Text("Intel").tag(NewsType.IntelNews)
            } // Picker
            .pickerStyle(SegmentedPickerStyle())
            switch selectedNewsType {
            case .TeslaNews:
                LazyView(NewsListView(viewModel: newsViewModels[.TeslaNews]!)).environmentObject(favorites)
            case .IntelNews:
                LazyView(NewsListView(viewModel: newsViewModels[.IntelNews]!)).environmentObject(favorites)
            }
        } // VStack
    }
}

struct NewsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreenView()
    }
}
