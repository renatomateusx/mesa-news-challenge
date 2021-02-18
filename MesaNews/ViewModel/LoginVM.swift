//
//  NewsHighLightVM.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

import Foundation
import SwiftUI

class LoginVM: ObservableObject {
    @Published var token: String = ""
    @State var isAuthenticated: Bool = false;
    func doLogin(login: Login){
        NewsAPI.login(user: login) { [self] (login) in
            self.token = login.token
            UserDef.setToken(token: token)
            self.isAuthenticated.toggle()
        }
    }
}
