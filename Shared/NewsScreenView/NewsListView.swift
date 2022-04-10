//
//  NewsListView.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 27.03.2022.
//

import SwiftUI
import TheNewsAPI

struct NewsListView: View {
    @StateObject private var newsViewModel: NewsViewModel
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    init(viewModel: @autoclosure @escaping () -> NewsViewModel) {
        _newsViewModel = StateObject(wrappedValue: viewModel())
    }
    
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
        NewsListView(viewModel: .init(newsType: .TeslaNews))
    }
}

struct NewsCellView: View {
    var newsInfo: NewsInfo
    
    @EnvironmentObject var favorites: Favorites
    @State var isFavoriteAnimationPercent: CGFloat = 0
    @State var isFavorite: Bool = false
    
    
    var body: some View {
        HStack {
            VStack {
                Text(newsInfo.title)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(1)
                    .font(Font.headline.weight(.bold))
                Spacer()
                    .frame(height: 8)
                Text(newsInfo.description)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .lineLimit(4)
                Spacer()
                Button {
                    // Альтернативная версия анимации
                    //let animationDuration = 1.3
                    //withAnimation(.easeInOut(duration: animationDuration / 2)) {
                    //    isFavoriteAnimationPercent = 1
                    //}
                    //DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration / 2) {
                    //    withAnimation(.easeInOut(duration: animationDuration / 2)) {
                    //        isFavoriteAnimationPercent = 0
                    //    }
                    //    isFavorite.toggle()
                    //}
                    
                    withAnimation(.easeIn(duration: 5.3)) {
                        isFavoriteAnimationPercent = 1
                    }
                    isFavorite.toggle()
                    favorites.add(newsInfo)
                } label: {
                    Text(isFavorite ? "Remove from favorites" : "Add to favorites" )
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .buttonStyle(PlainButtonStyle())
            }
            .frame(alignment: .leading)
            AsyncImage(url: URL(string: newsInfo.imageUrl ?? "")) { phase in
                switch phase {
                case .empty:
                    Color.gray.opacity(0.1)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 80, maxHeight: 80)
                case .failure(_):
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: 80, height: 80)
        }
        .frame(height: 120)
        .background(.white)
        .modifier(AddToFavoriteEffectV2(percent: isFavoriteAnimationPercent))
        .onAppear {
            isFavorite = favorites.contains(newsInfo)
        }
    }
}

//struct NewsCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsCellView(newsInfo: .init()) // TODO: Add example
//    }
//}
