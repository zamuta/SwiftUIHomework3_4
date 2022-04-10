//
//  NewsListView.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 27.03.2022.
//

import SwiftUI
import HomeWorkUI

struct NewsListView: View {
    @EnvironmentObject var newsViewModel: NewsViewModel
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    var body: some View {
        List {
            ForEach(newsViewModel.news, id: \.uuid) { newsInfo in
                let isLastItem = newsViewModel.news.last?.uuid == newsInfo.uuid
                NewsCellView(newsInfo:newsInfo)
                    .onAppear {
                        if (isLastItem && !newsViewModel.isLoading) {
                            newsViewModel.fetchNext()
                        }
                    }
                    .onTapGesture {
                        routeModel.push(screenView: LazyView(NewsInfo1ScreenView(title: newsInfo.title, description: newsInfo.description, imageUrl: newsInfo.imageUrl ?? "")).toAnyView())
                    }
            }
            if(newsViewModel.news.count < newsViewModel.total) {
                ProgressView()
            }
        } // List
        .listStyle(GroupedListStyle())
        .onAppear {
            newsViewModel.fetchNext()
        }
    }
}

struct NewsListView_Previews: PreviewProvider {
    static var previews: some View {
        NewsListView().environmentObject(NewsViewModel.init(query: "tesla"))
    }
}
