//
//  ArticleDetailWebView.swift
//  MesaNews
//
//  Created by Renato Mateus on 16/02/21.
//

import SwiftUI

struct ArticleDetailWebView: View {
    @State var isFavorite = false
    var detailArticle: Article
    var body: some View {
        ZStack {
            MesaNewsUIWebView(news: detailArticle)
                .padding(.top, 20)
            Button(action :
                    { setFavorite(news: detailArticle)}
            ){
                Image(systemName: isFavorite ? "heart.fill" : "heart")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.yellow)
                    .onAppear(){
                        checkIfFavorite(news: detailArticle)
                    }
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
            .padding(.trailing, 10)
        }
    }
    
    func setFavorite(news: Article){
        Utilis.saveFavorites(article: news)
        checkIfFavorite(news: news)
    }
    func checkIfFavorite(news:Article) {
        isFavorite = Utilis.checkIsFavorite(article: news)
    }
}
