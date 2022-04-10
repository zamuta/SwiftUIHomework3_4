//
//  NewsInfo1ScreenView.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

struct NewsInfo1ScreenView: View {
    var title: String
    var description: String
    var imageUrl: String
    
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    var body: some View {
        VStack {
            Text(title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(1)
                .font(Font.headline.weight(.bold))
            Spacer()
                .frame(height: 8)
            Text(description)
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                .lineLimit(4)
            Spacer()
            AsyncImage(url: URL(string: imageUrl)) { phase in
                switch phase {
                case .empty:
                    Color.gray.opacity(0.1)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 360, maxHeight: 360)
                case .failure(_):
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            } // AsyncImage
            .frame(height: 360)
            .frame(maxWidth: .infinity)
            Spacer()
            HStack {
                Button {
                    routeModel.pop()
                } label: {
                    Text("BACK")
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(PlainButtonStyle())
                Button {
                    routeModel.push(screenView: LazyView(NewsInfo2ScreenView(imageUrl: imageUrl)).toAnyView())
                } label: {
                    Text("TO FULL IMAGE")
                        .foregroundColor(.blue)
                }
                .frame(maxWidth: .infinity)
                .buttonStyle(PlainButtonStyle())
                .disabled(imageUrl.count == 0)
            }
        } // VStack
        .padding()
    }
}

struct NewsInfo1ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NewsInfo1ScreenView(title: "Title", description: "Description blah blah blah blah", imageUrl: "")
    }
}
