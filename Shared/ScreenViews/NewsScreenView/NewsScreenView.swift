//
//  NewsScreenView.swift
//  SwiftUIHomework2
//
//  Created by Mikhail Kanshin on 18.03.2022.
//

import SwiftUI
import HomeWorkUI

struct NewsScreenView: View {
    @EnvironmentObject private var multipleNewsViewModel: MultipleNewsViewModel
    
    @State private var selectedNewsType: NewsType = .TeslaNews
    
    var body: some View {
        VStack {
            Picker("Lists", selection: $selectedNewsType) {
                Text("Tesla").tag(NewsType.TeslaNews)
                Text("Intel").tag(NewsType.IntelNews)
            } // Picker
            .pickerStyle(SegmentedPickerStyle())
            switch selectedNewsType {
            case .TeslaNews:
                LazyView(NewsListView())
                    .environmentObject(multipleNewsViewModel.newsViewModel(.TeslaNews))
            case .IntelNews:
                LazyView(NewsListView())
                    .environmentObject(multipleNewsViewModel.newsViewModel(.IntelNews))
            }
        } // VStack
    }
}

struct NewsScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NewsScreenView()
    }
}
