//
//  FootballTeams.swift
//  SupportersAnchor
//
//  Created by 최준현 on 12/12/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let footballTeams = try? JSONDecoder().decode(FootballTeams.self, from: jsonData)

import Foundation

// MARK: - FootballTeams
struct FootballTeams: Codable {
    let response: [TeamResponse]
}

// MARK: - Response
struct TeamResponse: Codable, Hashable {
    let team: SelectTeam
    let venue: SelectVenue
}

// MARK: - Team
struct SelectTeam: Codable, Hashable {
    let id: Int
    let name: String
    let code: String?
    let country: String
    let founded: Int?
    let national: Bool
    let logo: String
}

// MARK: - Venue
struct SelectVenue: Codable, Hashable {
    let id: Int?
    let name, address, city: String?
    let capacity: Int?
    let surface: String?
    let image: String?
}

//class JSONNull: Codable, Hashable {
//
//    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
//        return true
//    }
//
//    public var hashValue: Int {
//        return 0
//    }
//
//    public init() {}
//
//    public required init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        if !container.decodeNil() {
//            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
//        }
//    }
//
//    public func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        try container.encodeNil()
//    }
//}


