//
//  Model.swift
//  SupportersAnchor
//
//  Created by seongjun on 2023/12/11.
//

import Foundation

struct News: Codable, Hashable {
    let title: String
    let originallink: String
    let description: String
    let pubDate: String
}

struct NewsList: Codable {
    let total: Int
    let start: Int
    let display: Int
    let items: [News]
}

// MARK: - API요청으로 인한 응답: articles
struct APIResults: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable, Hashable{
    let id: UUID = UUID()
    let author: String?
    let title: String
    let description: String?
    let url: String
    let urlToImage: String?
    let publishedAt: String
    let content: String?
    var favorite: Bool = false // 북마크 여부 프로퍼티
    
    // 북마크는 제외
    enum CodingKeys: String, CodingKey {
        case author, title, description, url, urlToImage, publishedAt, content
    }
}

extension Article: Equatable {
    static func ==(lhs: Article, rhs: Article) -> Bool {
        return lhs.id == rhs.id &&
            lhs.author == rhs.author &&
            lhs.title == rhs.title &&
            lhs.description == rhs.description &&
            lhs.url == rhs.url &&
            lhs.urlToImage == rhs.urlToImage &&
            lhs.publishedAt == rhs.publishedAt &&
            lhs.content == rhs.content
    }
}
