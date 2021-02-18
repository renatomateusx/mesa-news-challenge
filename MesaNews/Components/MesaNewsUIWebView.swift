//
//  MesaNewsUIWebView.swift
//  MesaNews
//
//  Created by Renato Mateus on 16/02/21.
//
import Foundation
import SwiftUI
import WebKit

struct MesaNewsUIWebView: UIViewRepresentable {
    var news: Article
    
    func makeUIView(context: Context) -> some WKWebView {
        guard let URLString = news.url else {return WKWebView()}
        guard let url = URL(string: URLString) else {
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let webview = WKWebView()
        webview.load(request)
        return webview
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        print ("OPA")
    }
    
}
