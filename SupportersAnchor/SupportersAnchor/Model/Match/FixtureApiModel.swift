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
    
    init() {
        self.fixture = Fixture(
           id: 867954,
           referee: "P. Tierney",
           timezone: "UTC",
           date: "2022-08-07T13:00:00+00:00",
           timestamp: 1659877200,
           periods: Periods(first: 1659877200, second: 1659880800),
           venue: Venue(id: 556, name: "Old Trafford", city: "Manchester"),
           status: Status(long: "Match Finished", short: "FT", elapsed: 90)
       )
        self.league = FixtureLeague(
            id: 39,
            name: "Premier League",
            country: "England",
            logo: "https://media-4.api-sports.io/football/leagues/39.png",
            flag: "https://media-4.api-sports.io/flags/gb.svg",
            season: 2022,
            round: "Regular Season - 1"
        )
        self.teams = Teams(
            home: Team(id: 33, name: "Manchester United", logo: "https://media-4.api-sports.io/football/teams/33.png", winner: false),
            away: Team(id: 51, name: "Brighton", logo: "https://media-4.api-sports.io/football/teams/51.png", winner: true)
        )
        self.goals =  Goals(home: 1, away: 2)
        self.score = Score(halftime: nil, fulltime: nil, extratime: nil, penalty: nil)
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
