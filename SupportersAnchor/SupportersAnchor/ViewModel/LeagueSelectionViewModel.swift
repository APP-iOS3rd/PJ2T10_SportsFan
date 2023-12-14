//
//  LeagueSelectionViewModel.swift
//  SupportersAnchor
//
//  Created by 최준현 on 12/12/23.
//

import Foundation
import Alamofire

class LeagueSelectionViewModel: ObservableObject{
    
    @Published var footballLeagueList  = [LeagueResponse]()
    
    
    func getLeagues(){
        
        guard let url = URL(string:"https://api-football-v1.p.rapidapi.com/v3/leagues?season=2023&current=true") else { return  }
    
        
        let headers : HTTPHeaders = ["X-RapidAPI-Key" : "5a037acc15msh4cbb6c53e88088bp11fc3ejsn93a49e9e121c",
                             "X-RapidAPI-Host" : "api-football-v1.p.rapidapi.com"]
        
        AF.request(
            url,
            method: .get,
            encoding: URLEncoding.default,
            headers: headers)
            .validate(statusCode: 200..<204)
            .responseDecodable(of: FootballLeagues.self) { response in
                switch response.result{
                case .success(let value):
                    self.footballLeagueList = value.response
                    print(self.footballLeagueList)
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
    }

}
