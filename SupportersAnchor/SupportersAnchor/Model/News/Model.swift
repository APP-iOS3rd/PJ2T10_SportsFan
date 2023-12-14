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

