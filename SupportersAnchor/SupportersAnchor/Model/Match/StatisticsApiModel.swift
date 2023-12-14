//
//  StatisticsApi.swift
//  SupportersAnchor
//
//  Created by lkh on 12/12/23.
//

import Foundation

struct StatisticsResponse: Codable {
    let get: String
    let parameters: StatisticsParameters
    let errors: [String]
    let results: Int
    let paging: Paging?
    let response: [StatisticsData]
}

struct StatisticsParameters: Codable {
    let fixture: String?
}

struct StatisticsData: Codable, Identifiable {
    let id = UUID()
    let team: TeamInfo
    let statistics: [Statistic]
    
    struct TeamInfo: Codable {
        let id: Int?
        let name: String?
        let logo: String?
    }
}

struct Statistic: Codable {
    let type: String?
    let value: String?
}

//enum StatisticValue: Codable {
//    case int(Int)
//    case string(String)
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if let intValue = try? container.decode(Int.self) {
//            self = .int(intValue)
//        } else if let stringValue = try? container.decode(String.self) {
//            self = .string(stringValue)
//        } else {
//            throw DecodingError.typeMismatch(
//                StatisticValue.self,
//                DecodingError.Context(
//                    codingPath: decoder.codingPath,
//                    debugDescription: "Int or String이 와줘야하는데 이상한거 옴"
//                )
//            )
//        }
//    }
//
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .int(let intValue):
//            try container.encode(intValue)
//        case .string(let stringValue):
//            try container.encode(stringValue)
//        }
//    }
//}
