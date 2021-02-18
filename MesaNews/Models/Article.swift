//
//  Article.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

import Foundation

struct Article: Codable, Identifiable {
    var title: String?
    var description: String?
    var content: String?
    var author: String?
    var published_at: String?
    var highlight: Bool?
    var url: String?
    var image_url: String?
    var id: String {url ?? UUID().uuidString}
    
}
