//
//  MatchScheduleViewModel.swift
//  SupportersAnchor
//
//  Created by lkh on 12/12/23.
//

import SwiftUI
import Foundation

class MatchScheduleViewModel: ObservableObject {
    @Published var fixtures: [FixtureData] = []
    
    @Published var selectedFixtureID: String?
    @Published var selectedFixtureStatistics: [StatisticsData] = []
    
    @Published var selectedFixturesEvents: [FixtureEvent] = []
    
    // MARK: - MatchSchedule 관련
    // ...
    // MARK: - moreFetch
    func moreFetch(leagueID: String, season: String, teamID: String) {
        if fixtures.isEmpty {
            fetchFixturesData(leagueID: leagueID, season: season, teamID: teamID)
        }
    }
    
    // MARK: - fetchFixturesData
    func fetchFixturesData(leagueID: String, season: String, teamID: String) {
        APIClient.shared.fetchFixtures(leagueID: leagueID, season: season, teamID: teamID, from: "2023-12-01", to: "2024-02-28") { result in
            switch result {
            case .success(let fixtureResponse):
                let newFixtures: [FixtureData] = fixtureResponse.response.map {
                    var mutableFixture = $0
                    mutableFixture.fixture.date = $0.fixture.date.formatDateString()
                    return mutableFixture
                }
                
                self.fixtures = newFixtures
                
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    
    // MARK: - MatchDetail 관련
    // ...
    // MARK: - selectFixture
    func selectFixture(fixture: FixtureData) {
        selectedFixtureID = String(fixture.fixture.id)
        fetchStatisticsData(fixtureID: selectedFixtureID)
        fetchEventssData(fixtureID: selectedFixtureID)
    }
    
    // MARK: - fetchStatisticsData
    func fetchStatisticsData(fixtureID: String?) {
        guard let fixtureID = fixtureID else {
            return
        }
        
        APIClient.shared.fetchStatistics(fixtureID: fixtureID) { result in
            switch result {
            case .success(let statisticsResponse):
                self.selectedFixtureStatistics = statisticsResponse.response
                print("통계 성공")
                
            case .failure(let error):
                print("통계 에러: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - events
    func fetchEventssData(fixtureID: String?) {
        guard let fixtureID = fixtureID else {
            return
        }
        
        APIClient.shared.fetchEvent(fixtureID: fixtureID) { result in
            switch result {
            case .success(let FixtureEventsResponse):
                self.selectedFixturesEvents = FixtureEventsResponse.response
                print("성공")
                
            case .failure(let error):
                print("에러: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - isInGoal
    func isInGoal(_ name: String) -> Bool {
        for events in selectedFixturesEvents {
            if events.type == "Goal" && events.team.name == name {
                return true
            }
        }
        return false
    }
}
