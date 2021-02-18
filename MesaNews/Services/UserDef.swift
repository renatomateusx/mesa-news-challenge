//
//  UserDef.swift
//  MesaNews
//
//  Created by Renato Mateus on 16/02/21.
//

import Foundation

class UserDef {
    
    class func getToken() -> String{
        let defaults = UserDefaults.standard
        guard let token = defaults.string(forKey: "Token") else {return ""}
        return token
    }
    
    class func setToken(token:String){
        let defaults = UserDefaults.standard
        
        defaults.set(token, forKey: "Token")
    }
    
    class func isAuthenticated() -> Bool{
        let token = getToken()
        return token.count > 0
    }
    
}
