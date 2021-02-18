//
//  Login.swift
//  MesaNews
//
//  Created by Renato Mateus on 17/02/21.
//

import Foundation

struct Login: Codable, Identifiable {
    var id: String {UUID().uuidString}
    var email: String
    var password: String
    var token: String
  
    
    init(email: String, password:String){
        self.email = email
        self.password = password
        self.token = ""
    }
    
    init(email: String, password:String, token: String){
        self.email = email
        self.password = password
        self.token = token
    }
}
