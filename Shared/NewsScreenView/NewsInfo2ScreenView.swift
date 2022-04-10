//
//  NewsInfo2ScreenView.swift
//  SwiftUIHomework2 (iOS)
//
//  Created by Mikhail Kanshin on 26.03.2022.
//

import SwiftUI

struct NewsInfo2ScreenView: View {
    var imageUrl: String
    
    @EnvironmentObject var routeModel: NavigationContainerViewModel
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                let screenSize = UIScreen.main.bounds.size
                switch phase {
                case .empty:
                    Color.gray.opacity(0.1)
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: screenSize.width, maxHeight: screenSize.height)
                case .failure(_):
                    EmptyView()
                @unknown default:
                    EmptyView()
                }
            } // AsyncImage
            .frame(maxWidth: .infinity)
            Spacer()
            Button {
                routeModel.pop()
            } label: {
                Text("BACK")
                    .foregroundColor(.blue)
            }
        } // VStack
        .padding()
    }
}

struct NewsInfo2ScreenView_Previews: PreviewProvider {
    static var previews: some View {
        NewsInfo2ScreenView(imageUrl: "")
    }
}
