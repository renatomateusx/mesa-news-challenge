//
//  NewsHighLightVM.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

import Foundation


class MesaNewsVM: ObservableObject {
    @Published var news = [MesaNewsViewModel]()
    @Published var newsArray = [MesaNewsViewModel]()
    func load(){
        getNews()
    }
    
     func getNews(){
        NewsAPI.fetchNews { (news) in
           let newsVM = news.map(MesaNewsViewModel.init)
           self.news = newsVM
           self.newsArray = newsVM
            
           let delayTime = DispatchTime.now() + 30.0
            DispatchQueue.main.asyncAfter(deadline: delayTime, execute: {
               self.load()
            })
        }
    }
}
