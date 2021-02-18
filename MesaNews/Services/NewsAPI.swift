//
//  newsAPI.swift
//  MesaNews
//
//  Created by Renato Mateus on 11/02/21.
//

import Foundation
import Alamofire

class NewsAPI: NSObject {
    
    override init() {
        
        super.init()
    }
    
    
    //MARK: - Properties
    
    class var decoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }
    
    class var header:HTTPHeaders {
        guard let secret = Helper.getSecret() else { return HTTPHeaders.default }
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(secret.token)",
            "Content-Type": "application/json"
        ]
        return headers
    }
    class var dateFormatter:DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        return formatter
    }
    class var getTodayDate:String {
        let date = Date()
        let today = date
        let todayDate = "\(dateFormatter.string(from: today))"
        return todayDate
    }
    
    //MARK: - Fetch HighLightsNews Method
    
    class func fetchHighLightsNews(completion: @escaping (([Article]) -> Void)){
        AF.request(topHighLightsPath, headers: header).responseJSON { (response) in
            if let responseJSON = response.value as? [String: Any],
               let highLightsList = responseJSON["data"], let data = try? JSONSerialization.data(withJSONObject: highLightsList){
                let hightLightsArticles = try? decoder.decode([Article].self, from: data)
                completion(hightLightsArticles ?? [])
            }
        }
    }
    
    //MARK: - Fetch News Method
    class func fetchNews(completion: @escaping (([Article]) -> Void)){
      
        AF.request(topNewsPath, headers: header).responseJSON { (response) in
            if let responseJSON = response.value as? [String: Any],
               let newsList = responseJSON["data"], let data = try? JSONSerialization.data(withJSONObject: newsList){
                let newsArticles = try? decoder.decode([Article].self, from: data)
                completion(newsArticles ?? [])
            }
        }
    }
    
    //MARK: - SignIn Method
    
    class func login(user: Login,completion: @escaping ((Login) -> Void)){
        let params = [
            "email": user.email,
            "password": user.password
        ]
        AF.request(loginPath, method: .post, parameters: params, encoding: JSONEncoding.default, headers: header)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                if let responseJSON = response.value as? [String: Any]{
                    let loginDTO = Login(email: user.email, password: user.password, token: responseJSON["token"] as! String)
                    completion(loginDTO)
                }
           //MARK: TODO - TREAT THE RETORNO WITH SWITCH CASE RESPONSE.RESULT .... SUCCESS AND FAILURE
        }
    }
}
