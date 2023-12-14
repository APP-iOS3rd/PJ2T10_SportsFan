//
//  NewsAPI.swift
//  SupportersAnchor
//
//  Created by seongjun on 2023/12/11.
//

import Foundation
import Alamofire

class NewsAPI: ObservableObject {
    static let shared = NewsAPI()
    
    private init() { }
    
    @Published var newsList = [News]()

    func requestSearchNewsList(query: String) {
        let baseURL = "https://openapi.naver.com/v1/search/news.json"
        
        let headers: HTTPHeaders = [
            "X-Naver-Client-Id": Storage().naverClientID,
            "X-Naver-Client-Secret": Storage().naverClientSecret,
        ]
        
        let parameters: Parameters = [
            "query": query,
            "display": 10,
            "start": 1,
            "sort": "sim",
            "filter": "all"
        ]
        
        AF.request(baseURL,
                   method: .get,
                   parameters: parameters,
                   encoding: URLEncoding.default,
                   headers: headers)
        .validate(statusCode: 200...500)
        .responseDecodable(of: NewsList.self) { response in
            switch response.result {
            case .success(let data):
                guard let statusCode = response.response?.statusCode else { return }
                if statusCode == 200 {
                    DispatchQueue.main.async {
                        self.newsList = data.items
                    }
                    dump(data.items)
                }
                print("\(#file) > \(#function) :: SUCCESS")
            case .failure(let error):
                print("\(#file) > \(#function) :: FAILURE : \(error)")
            }
        }
    }
}
