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
    private let eventBaseURL = "https://api-football-v1.p.rapidapi.com/v3/fixtures/events"
    
    static var apiKey: String = getApiKey("API_KEY")
    
    private let headers: HTTPHeaders = [
        "X-RapidAPI-Key": "\(apiKey)",
        "X-RapidAPI-Host": "api-football-v1.p.rapidapi.com"
    ]
    
    // MARK: - fetchFixtures
    func fetchFixtures(leagueID: String, season: String, teamID: String, from: String? = nil, to: String? = nil, completion: @escaping (Result<FixtureResponse, AFError>) -> Void) {
        var parameters: [String: Any] = [
            "league": leagueID,
            "season": season,
            "team": teamID
        ]
        
        if let fromDate = from, let toDate = to {
            parameters["from"] = fromDate
            parameters["to"] = toDate
        }
        
        AF.request(fixturesBaseURL, method: .get, parameters: parameters, headers: headers)
            .validate()
            .responseDecodable(of: FixtureResponse.self) { response in
                completion(response.result)
            }
    }
    
    // MARK: - fetchEvent
    func fetchEvent(fixtureID: String, completion: @escaping (Result<FixtureEventsResponse, AFError>) -> Void) {
        let eventURL = "\(eventBaseURL)?fixture=\(fixtureID)"

        AF.request(eventURL, method: .get, headers: headers)
            .validate()
            .responseDecodable(of: FixtureEventsResponse.self) { response in
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
