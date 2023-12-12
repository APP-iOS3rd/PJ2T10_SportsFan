//
//  MatchScheduleViewModel.swift
//  SupportersAnchor
//
//  Created by lkh on 12/12/23.
//

import Foundation

class MatchScheduleViewModel: ObservableObject {
    @Published var fixtures: [FixtureData] = []
    @Published var selectedDetails: [StatisticsData] = []
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
        APIClient.shared.fetchFixtures(leagueID: leagueID, season: season, teamID: teamID) { result in
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
    // MARK: - fetchStatisticsData
    func fetchStatisticsData(fixtureID: String) {
        APIClient.shared.fetchStatistics(fixtureID: fixtureID) { result in
            switch result {
            case .success(let statisticsResponse):
                self.selectedDetails = statisticsResponse.response
                print("성공")

            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // MARK: - selectFixture
    func selectFixture(fixture: FixtureData) {
        print(fixture.fixture.id)
        fetchStatisticsData(fixtureID: String(fixture.fixture.id))
    }

}
