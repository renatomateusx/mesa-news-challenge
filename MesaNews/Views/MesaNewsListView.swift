//
//  HighLightView.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct MesaNewsListView: View {
    @ObservedObject var mesaNewsVM = MesaNewsVM()
    @State var offset = 0
    @State var showFavorites = false
    @State var filterByDate = Date()
    
    
    init() {
        mesaNewsVM.load()
    }
    
    
    var body: some View {
        VStack{
            Toggle("Only Favorites", isOn: $showFavorites)
                .font(.system(size: 20.0, weight: .bold))
                .padding(5)
                .onChange(of: showFavorites, perform: { value in
                    print("Value \(value)")
                    if(showFavorites){
                        self.filteredNews(filter: filter.favorites)
                    }
                    else{
                        self.filteredNews(filter: filter.none)
                    }
                })
            DatePicker("Filter by date", selection: $filterByDate, displayedComponents: [.date])
                .font(.system(size: 20.0, weight: .bold))
                .padding(5)
                .onChange(of: filterByDate, perform: { date in
                    print("Value Date \(date)")
                    self.filteredNews(filter: filter.dated)
                })
            Button("Clear Filters"){
                self.filteredNews(filter: filter.none)
                self.showFavorites = false
            }
            .font(.system(size: 15.0, weight: .bold))
            .padding(5)
                
            ForEach(self.mesaNewsVM.newsArray , id: \.id) { news in
                MesaView(news: news.news)
            }
        }
    }
    
    enum filter {
        case none
        case favorites
        case dated
    }
    
    func filteredNews(filter: filter){
        
        switch filter {
        case .none:
            self.mesaNewsVM.newsArray = self.mesaNewsVM.news
        case .favorites:
            self.mesaNewsVM.newsArray = self.mesaNewsVM.news.filter{ Utilis.checkIsFavorite(article: $0.news) }
        case .dated:
            self.mesaNewsVM.newsArray = self.mesaNewsVM.news.filter
            { convertPublishiedAt(datePub: ($0.news.published_at ?? "")) == getDateString()}
        }
    }
    func getDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        let dateReturn = formatter.string(from: self.filterByDate)
        return dateReturn
    }
    func convertPublishiedAt(datePub: String) -> String{
        var dateReturn = ""
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.timeZone = TimeZone.autoupdatingCurrent
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        if let date = formatter.date(from: datePub) {
            formatter.dateFormat = "yyyy-MM-dd"
            dateReturn = formatter.string(from: date)
        }
        
        return dateReturn
    }
    
}

struct MesaView: View {
    
    var news: Article
    @State var isFavorite = false
    @State private var isPresented: Bool = false
    
    var body: some View {
        VStack {
            
                Button(action :
                        { setFavorite(news: news)}
                ){
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 25, height: 25)
                        .foregroundColor(.yellow)
                        .onAppear(){
                            checkIfFavorite(news: news)
                        }
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing, 10)
                
                AnimatedImage(url: URL(string: news.image_url ?? Helper.getNoURL()))
                    .resizable()
                    .frame(maxHeight: 250)
                    .aspectRatio(contentMode: .fill)
                    .clipped()
                    .cornerRadius(7.0)
                    .padding(.leading, 5)
                    .padding(.trailing, 5)
                    .shadow(color: .black, radius: 5, x: 5, y: 8)
           
                Text(news.author ?? "")
                    .font(.system(size: 14.0, weight:.light))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .padding(.leading, 5)
                Text(news.title ?? "")
                    .font(.system(size: 18.0, weight: .heavy))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(5)
                    .padding(.leading, 5)
        }.sheet(isPresented: $isPresented){
            ArticleDetailWebView(detailArticle: news)
        }.onTapGesture {
            self.isPresented.toggle()
        }
    }
    
    
    
    func setFavorite(news: Article){
        Utilis.saveFavorites(article: news)
        checkIfFavorite(news: news)
    }
    func checkIfFavorite(news:Article) {
        isFavorite = Utilis.checkIsFavorite(article: news)
    }
    
    
    
}






struct MesaNewsListView_Previews: PreviewProvider {
    static var previews: some View {
        MesaNewsListView()
    }
}
