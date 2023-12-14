//
//  NewsViewModel.swift
//  SupportersAnchor
//
//  Created by lkh on 12/14/23.
//

import Foundation

class NewsViewModel: ObservableObject {
    static let shared = NewsViewModel()
    
    @Published var newsList: [Article] = [] // 뉴스기사들을 담을 배열
    
    func fetchPostNews(_ query: String) async throws {
        guard let url = NewsAPI.RequestEverythingURL(q: query, sortBy: "popularity") else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: url)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                DispatchQueue.main.async {
                    self.newsList = [] // 상태 코드가 200이 아닌 경우, 배열을 비워서 초기화
                }
                return
            }
            let apiResult = try JSONDecoder().decode(APIResults.self, from: data)
            DispatchQueue.main.async {
                self.newsList = apiResult.articles
            }
        } catch {
            throw error
        }
    }
}
