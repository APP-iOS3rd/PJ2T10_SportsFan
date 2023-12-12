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
    let team: Team
    let venue: Venue
}

// MARK: - Team
struct Team: Codable, Hashable {
    let id: Int
    let name, code: String
    let country: String
    let founded: Int
    let national: Bool
    let logo: String
}

// MARK: - Venue
struct Venue: Codable, Hashable {
    let id: Int
    let name, address, city: String
    let capacity: Int
    let surface: String
    let image: String
}


