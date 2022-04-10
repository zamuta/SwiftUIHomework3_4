//
//  NewsCellView.swift
//  SwiftUIHomework (iOS)
//
//  Created by Mikhail Kanshin on 10.04.2022.
//

import SwiftUI
import TheNewsAPI

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
                    if isFavorite == false {
                        favorites.add(newsInfo)
                    } else {
                        favorites.remove(newsInfo)
                    }
                    isFavorite = favorites.contains(newsInfo)
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
