//
//  FixtureApiModel.swift
//  SupportersAnchor
//
//  Created by lkh on 12/12/23.
//

import Foundation

struct FixtureResponse: Codable {
    let get: String
    let parameters: FixtureParameters
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [FixtureData]
}

struct FixtureParameters: Codable {
    let league: String
    let season: String
    let team: String
}

struct Paging: Codable {
    let current: Int?
    let total: Int?
}

struct FixtureData: Codable {
    var fixture: Fixture
    let league: FixtureLeague
    let teams: Teams
    let goals: Goals
    let score: Score
    
    enum CodingKeys: String, CodingKey {
        case fixture, league, teams, goals, score
    }
    
    
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        fixture = try container.decode(Fixture.self, forKey: .fixture)
        league = try container.decode(FixtureLeague.self, forKey: .league)
        teams = try container.decode(Teams.self, forKey: .teams)
        goals = try container.decode(Goals.self, forKey: .goals)
        score = try container.decode(Score.self, forKey: .score)
        
    }
}

struct Fixture: Codable {
    let id: Int
    let referee: String?
    let timezone: String
    var date: String
    let timestamp: Int
    let periods: Periods
    let venue: Venue
    let status: Status
}

struct Periods: Codable {
    let first: Int?
    let second: Int?
}

struct Venue: Codable {
    let id: Int?
    let name: String?
    let city: String?
}

struct Status: Codable {
    let long: String?
    let short: String?
    let elapsed: Int?
}

struct FixtureLeague: Codable {
    let id: Int
    let name: String
    let country: String
    let logo: String
    let flag: String
    let season: Int
    let round: String?
}

struct Teams: Codable {
    let home: Team
    let away: Team
}

struct Team: Codable {
    let id: Int
    let name: String
    let logo: String
    let winner: Bool?
}

struct Goals: Codable {
    let home: Int?
    let away: Int?
}

struct Score: Codable {
    let halftime: Halftime?
    let fulltime: Fulltime?
    let extratime: ExtraTime?
    let penalty: Penalty?
    
    struct Halftime: Codable {
        let home: Int?
        let away: Int?
    }
    
    struct Fulltime: Codable {
        let home: Int?
        let away: Int?
    }
    
    struct ExtraTime: Codable {
        let home: Int?
        let away: Int?
    }
    
    struct Penalty: Codable {
        let home: Int?
        let away: Int?
    }
}
