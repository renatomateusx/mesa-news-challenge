//
//  HighLightsViewModel.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

struct MesaNewsViewModel {
    let news: Article
    
    var id: String {
        return news.id
    }
    var title: String {
        return news.title ?? ""
    }
    var description: String {
        return news.description ?? ""
    }
    var content: String {
        return news.content ?? ""
    }
    var author: String {
        return news.author ?? "Unknown"
    }
    var published_at: String {
        return news.published_at ?? ""
    }
    var highlight: Bool {
        return news.highlight ?? false
    }
    var url: String {
        return news.url ?? ""
    }
    var image_url: String {
        return news.image_url ?? "https://www.kindpng.com/picc/m/182-1827064_breaking-news-banner-png-transparent-background-breaking-news.png"
    }
}
