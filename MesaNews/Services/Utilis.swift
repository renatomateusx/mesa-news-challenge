//
//  Utilis.swift
//  MesaNews
//
//  Created by Renato Mateus on 15/02/21.
//

import Foundation

class Utilis {
    
    class func saveFavorites(article: Article){
        guard let imageUrl = article.image_url else { return}
        let defaults = UserDefaults.standard
        var arrayFavorites = defaults.stringArray(forKey: "Favorites") ?? [String]()
        if(arrayFavorites.contains(imageUrl)){
            guard let positionIndex = arrayFavorites.firstIndex(of: imageUrl) else {return}
            arrayFavorites.remove(at: positionIndex)
        }
        else{
            arrayFavorites.append(imageUrl)
        }
        defaults.set(arrayFavorites, forKey: "Favorites")
    }
    
    class func checkIsFavorite(article: Article) -> Bool {
        guard let imageUrl = article.image_url else {return false}
        let defaults = UserDefaults.standard
        let arrayFavorites = defaults.stringArray(forKey: "Favorites") ?? [String]()
        if(arrayFavorites.contains(imageUrl)){
            return true
        }
        return false
    }
}
