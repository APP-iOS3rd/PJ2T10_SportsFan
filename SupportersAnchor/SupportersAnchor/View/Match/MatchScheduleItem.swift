//
//  MatchScheduleItem.swift
//  SupportersAnchor
//
//  Created by lkh on 12/13/23.
//

import SwiftUI

// MARK: - MatchScheduleItem
// 리스트 셀 또는 한 경기 정보
struct MatchScheduleItem: View {
    let fixture: FixtureData
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            HStack(alignment: .center, spacing: 0) {
                Text(fixture.fixture.date)
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
            }
            
            HStack(alignment: .center, spacing: 10) {
                Spacer()
                VStack(alignment: .center, spacing: 15) {
                    fetchImage(url: fixture.teams.home.logo)
                    Text("\(fixture.teams.home.name)")
                        .lineLimit(1)
                        .foregroundColor(.black)

                }
                
                Spacer()
                
                if let long = fixture.fixture.status.long, long == "Match Finished" {
                    Text("\(fixture.goals.home ?? 0) : \(fixture.goals.away ?? 0)")
                        .foregroundColor(.black)

                } else {
                    Text("VS")
                        .foregroundColor(.black)

                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 15) {
                    fetchImage(url: fixture.teams.away.logo)
                    Text("\(fixture.teams.away.name)")
                        .lineLimit(1)
                        .foregroundColor(.black)

                }
                
                Spacer()
            }
        }
        .padding(.horizontal)
    }
    
    // MARK: - fetchImage
    func fetchImage(url: String) -> some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(Color.white)
            AsyncImage(url: URL(string: url)) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "arrow.circlepath")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
            }
        }
        .frame(width: 96, height: 140)
    }
}
