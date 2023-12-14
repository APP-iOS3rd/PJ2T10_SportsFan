//
//  NewsAPI.swift
//  SupportersAnchor
//
//  Created by seongjun on 2023/12/11.
//

import Foundation
import Alamofire

class NewsAPI {
    static let shared = NewsAPI()
    
    private init() { }
    
    static let everythingURL:String = "https://newsapi.org/v2/everything"
    static var apiKey : String = getApiKey("NEWS_API_KEY")

    
    static func RequestEverythingURL(q: String, from:String? = nil, to:String? = nil, language:String? = nil ,sortBy: String? = nil) -> URLRequest? {
        
        let url = URL(string: everythingURL)!
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)
        
        // 이제 파라미터 설정
        var queryItems: [URLQueryItem] = []
        queryItems.append(URLQueryItem(name: "q", value: q))
        
        // from
        if let from = from {
            queryItems.append(URLQueryItem(name: "from", value: from))
        }
        
        // to
        if let to = to {
            queryItems.append(URLQueryItem(name: "to", value: to))
        }
        
        // language
        if let language = language {
            queryItems.append(URLQueryItem(name: "language", value: language))
        }
        
        // sortBy
        if let sortBy = sortBy {
            queryItems.append(URLQueryItem(name: "sortBy", value: sortBy))
        }
        
        // apiKey는 필수
        queryItems.append(URLQueryItem(name: "apiKey", value: apiKey))
        
        components?.queryItems = queryItems
        
        // 마지막 체크
        guard let requestURL = components?.url else {
            fatalError("잘못된 URL")
        }
        
        return URLRequest(url: requestURL)
    }
}
