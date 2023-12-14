//
//  EventApiModel.swift
//  SupportersAnchor
//
//  Created by lkh on 12/13/23.
//

import Foundation

struct FixtureEventsResponse: Codable {
    let get: String
    let parameters: EventParameters
    let errors: [String]
    let results: Int
    let paging: Paging
    let response: [FixtureEvent]
}

struct EventParameters: Codable {
    let fixture: String
}

struct FixtureEvent: Codable, Identifiable {
    let id = UUID()
    let time: EventTime
    let team: EventTeam
    let player: EventPlayer
    let assist: EventAssist
    let type: String?
    let detail: String?
    let comments: String?

    struct EventTime: Codable {
        let elapsed: Int?
        let extra: Int?
    }

    struct EventTeam: Codable {
        let id: Int?
        let name: String?
        let logo: String?
    }

    struct EventPlayer: Codable {
        let id: Int?
        let name: String?
    }

    struct EventAssist: Codable {
        let id: Int?
        let name: String?
    }
}

