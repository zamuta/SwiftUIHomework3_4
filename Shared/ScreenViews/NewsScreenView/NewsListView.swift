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
    
    @EnvironmentObject var favorites: FavoritesViewModel
    @State var isFavoriteAnimationPercent: CGFloat = 0
    @State var isFavoriteAnimationEnabled: Bool = false
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
                    withAnimation(.easeIn(duration: 1.3)) {
                        isFavoriteAnimationPercent = isFavorite ? 0 : 1
                    }
                    isFavorite.toggle()
                    if isFavorite == false {
                        favorites.add(newsInfo)
                    } else {
                        favorites.remove(newsInfo)
                    }
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
        .modifier(AddToFavoriteAnimationViewModifier(animationPercent: isFavoriteAnimationPercent, animationEnabled: isFavoriteAnimationEnabled))
        .onAppear {
            isFavorite = favorites.contains(newsInfo)
            isFavoriteAnimationPercent = isFavorite ? 1 : 0
            isFavoriteAnimationEnabled = true
        }
        .onDisappear {
            isFavoriteAnimationEnabled = false
        }
    }
}

//struct NewsCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        NewsCellView(newsInfo: .init()) // TODO: Add example
//    }
//}
