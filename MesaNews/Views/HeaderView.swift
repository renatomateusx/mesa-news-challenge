//
//  HeaderView.swift
//  MesaNews
//
//  Created by Renato Mateus on 12/02/21.
//

import SwiftUI

struct HeaderView: View {
    var dateFormatter:DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM"
        return formatter
    }
    var body: some View {
        HStack {
            VStack(alignment: .trailing) {
                Text("MesaNews")
                Text("\(Date(), formatter: dateFormatter)")
                    .foregroundColor(.gray)
            }
            
        }
        .frame(maxWidth: .infinity)
        .font(.system(size: 34.0, weight: .heavy))
        .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
