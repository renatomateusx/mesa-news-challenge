//
//  File.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

import Foundation

struct Secret: Codable {
    var token: String
    
    enum CodingKeys: String, CodingKey{
        case token = "token"
    }
}
