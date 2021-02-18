//
//  Helper.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

import Foundation

class Helper: NSObject {
    class func getSecret() -> Secret? {
        guard let url = Bundle.main.url(forResource: "Info.plist", withExtension: nil), let data = try? Data(contentsOf: url) else {return nil}
        return try? PropertyListDecoder().decode(Secret.self, from: data)
    }
    class func getNoURL() -> String {
        return "https://www.kindpng.com/picc/m/182-1827064_breaking-news-banner-png-transparent-background-breaking-news.png"
    }
}
