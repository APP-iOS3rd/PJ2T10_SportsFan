//
//  FixtureApi.swift
//  SupportersAnchor
//
//  Created by lkh on 12/12/23.
//

import Foundation
import Alamofire

class APIClient {
    static let shared = APIClient()
    
    private let fixturesBaseURL = "https://api-football-v1.p.rapidapi.com/v3/fixtures"
    private let statisticsBaseURL = "https://api-football-v1.p.rapidapi.com/v3/fixtures/statistics"

    private let headers: HTTPHeaders = [
        "X-RapidAPI-Key": "5a037acc15msh4cbb6c53e88088bp11fc3ejsn93a49e9e121c",
        "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com"
    ]
    
    // MARK: - fetchFixtures
    func fetchFixtures(leagueID: String, season: String, teamID: String, completion: @escaping (Result<FixtureResponse, AFError>) -> Void) {
        let parameters: [String: Any] = [
            "league": leagueID,
            "season": season,
            "team": teamID
        ]
        
        AF.request(fixturesBaseURL, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: FixtureResponse.self) { response in
                completion(response.result)
            }
    }
    
    // MARK: - fetchStatistics
    func fetchStatistics(fixtureID: String, completion: @escaping (Result<StatisticsResponse, AFError>) -> Void) {
         let statisticsURL = "\(statisticsBaseURL)?fixture=\(fixtureID)"
         
         AF.request(statisticsURL, method: .get, headers: headers)
             .validate()
             .responseDecodable(of: StatisticsResponse.self) { response in
                 completion(response.result)
             }
     }
}

extension String {
    func formatDateString() -> String {
        let dateFormatterInput = DateFormatter()
        dateFormatterInput.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        if let date = dateFormatterInput.date(from: self) {
            let dateFormatterOutput = DateFormatter()
            dateFormatterOutput.dateFormat = "MM.dd EEE (HH:mm) yyyy"
            return dateFormatterOutput.string(from: date)
        } else {
            return self
        }
    }
}
