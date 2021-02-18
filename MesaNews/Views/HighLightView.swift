//
//  HighLightView.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct HighLightView: View {
    @ObservedObject private var highlightsVM = NewsHighLightVM()
    
    init() {
        highlightsVM.load()
    }
   
    
    var body: some View {           
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(self.highlightsVM.highlights, id: \.id) { highlight in
                    VStack {
                        AnimatedImage(url: URL(string: highlight.highlights.image_url ?? Helper.getNoURL()))
                            .resizable()
                            .frame(width: 160, height: 160)
                            .aspectRatio(contentMode: .fill)
                            .clipped()
                            .cornerRadius(7.0)
                        VStack {
                            Text(highlight.highlights.author ?? "")
                                .font(.system(size: 12.0, weight:.light))
                                .frame(width: 160, alignment: .leading)
                            Text(highlight.highlights.title ?? "")
                                .font(.system(size: 10.0, weight: .heavy))
                                .frame(width: 160)
                        }
                        .frame(width: 160)
                        
                    }
                    .frame(height: 250)
                    .padding(.leading, 5)
                }
            }
        }
    }
}



struct HighLightView_Previews: PreviewProvider {
    static var previews: some View {
        HighLightView()
    }
}
