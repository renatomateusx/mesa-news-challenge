//
//  NewsHighLightVM.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

import Foundation

class NewsHighLightVM: ObservableObject {
    @Published var highlights = [HighLightViewModel]()
    
    func load(){
        getHighLights()
    }
    
     func getHighLights(){
        NewsAPI.fetchHighLightsNews { (highlights) in
           let newsVM = highlights.map(HighLightViewModel.init)
           self.highlights = newsVM
        }
    }
}
