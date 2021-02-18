//
//  HighLightsViewModel.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

struct HighLightViewModel {
    let highlights: Article
    
    var id: String {
        return highlights.id
    }
    var title: String {
        return highlights.title ?? ""
    }
    var description: String {
        return highlights.description ?? ""
    }
    var content: String {
        return highlights.content ?? ""
    }
    var author: String {
        return highlights.author ?? "Unknown"
    }
    var published_at: String {
        return highlights.published_at ?? ""
    }
    var highlight: Bool {
        return highlights.highlight ?? false
    }
    var url: String {
        return highlights.url ?? ""
    }
    var image_url: String {
        return highlights.image_url ?? "https://www.kindpng.com/picc/m/182-1827064_breaking-news-banner-png-transparent-background-breaking-news.png"
    }
}
