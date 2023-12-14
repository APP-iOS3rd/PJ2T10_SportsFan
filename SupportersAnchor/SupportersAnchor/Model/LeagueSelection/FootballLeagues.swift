//
//  FootballLeagues.swift
//  SupportersAnchor
//
//  Created by 최준현 on 12/12/23.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let footballLeagues = try? JSONDecoder().decode(FootballLeagues.self, from: jsonData)

import Foundation

// MARK: - FootballLeagues
struct FootballLeagues: Codable {
    let response: [LeagueResponse]
}

// MARK: - Response
struct LeagueResponse: Codable, Hashable {
    let league: SelectLeague
    let country: SelectCountry
    let seasons: [SelectSeason]
}

// MARK: - Country
struct SelectCountry: Codable, Hashable {
    let name: String
    let code: String?
    let flag: String?
}

// MARK: - League
struct SelectLeague: Codable, Hashable{
    let id: Int
    let name: String
    let type: TypeEnum
    let logo: String
}

enum TypeEnum: String, Codable {
    case cup = "Cup"
    case league = "League"
}

// MARK: - Season
struct SelectSeason:Codable, Hashable{
    let year: Int
    let start, end: String
    let current: Bool
    let coverage: SelectCoverage
}

// MARK: - Coverage
struct SelectCoverage: Codable, Hashable{
    let fixtures: SelectFixtures
    let standings, players, topScorers, topAssists: Bool
    let topCards, injuries, predictions, odds: Bool

    enum CodingKeys: String, CodingKey {
        case fixtures, standings, players
        case topScorers = "top_scorers"
        case topAssists = "top_assists"
        case topCards = "top_cards"
        case injuries, predictions, odds
    }
}

// MARK: - Fixtures
struct SelectFixtures: Codable, Hashable{
    let events, lineups, statisticsFixtures, statisticsPlayers: Bool

    enum CodingKeys: String, CodingKey {
        case events, lineups
        case statisticsFixtures = "statistics_fixtures"
        case statisticsPlayers = "statistics_players"
    }
}
