//
//  MatchScheduleView.swift
//  SupportersAnchor
//
//  Created by lkh on 12/7/23.
//

import SwiftUI

struct Dummy {
    let team1:String
    let team2:String
    let score:String?
    let date:String
    
    init(team1: String, team2: String, score: String?,date: String) {
        self.team1 = team1
        self.team2 = team2
        self.score = score
        self.date = date
    }
    

    
    static func getDummy() -> [Dummy] {
        let dummyData: [Dummy] = [
            Dummy(team1: "맨시티", team2: "토트넘", score: nil,date: "12.11 월"),
            Dummy(team1: "토트넘", team2: "아스톤 빌라", score: nil, date: "12.24 금")
        ]
        return dummyData
    }
}

struct MatchScheduleView: View {
    private let matches = Dummy.getDummy()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .center, spacing: 10) {
                    ForEach(matches, id: \.team1) { match in
                        HStack(alignment: .center, spacing: 0) {
                            Text(match.date)
                                .font(.headline)
                            Spacer()
                        }
                        MatchScheduleItem(match: match)
                    }
                    .padding()
                }
            }
        }
    }
}

struct MatchScheduleItem: View {
    let match: Dummy
    
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            
            VStack(alignment: .center, spacing: 10) {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 118, height: 138)
                Text(match.team1)
                    .font(.headline)
                    .lineLimit(1)
                    .lineSpacing(4)
            }
            
            if let score = match.score {
                Text(score)
            } else {
                Text("vs")
            }
            
            VStack(alignment: .center, spacing: 10) {
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 118, height: 138)
                Text(match.team1)
                    .font(.headline)
                    .lineLimit(1)
                    .lineSpacing(4)
            }
        }
    }
}

#Preview {
    MatchScheduleView()
}
