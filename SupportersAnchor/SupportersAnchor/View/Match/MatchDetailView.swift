//
//  MatchDetailView.swift
//  SupportersAnchor
//
//  Created by 최준현 on 12/11/23.
//

import SwiftUI
import Charts

struct ChartData : Identifiable{
    var id = UUID()
    let department: String
    let profit: Int
    let category: String
}

struct MatchDetailView: View {
    @EnvironmentObject private var viewModel: MatchScheduleViewModel
    let match: FixtureData
    
    var body: some View {
        NavigationStack{
            VStack {
                HStack {
                    Text(match.fixture.date.formatDateString())
                        .font(.headline)
                        .foregroundColor(.black)
                    Spacer()
                }
                
                scoreDisplayBoard()
                    .padding()
                
                Divider()
                
                displayBoard()
                    .padding()
                
                Divider()
                
//                StatisBoard()
//                    .padding()
                Spacer()
                
            } //VStack
            .padding()
        }
        //.navigationTitle(viewModel.selectedFixture.fixture.date)
    }
    
    // MARK: - scoreDisplayBoard
    // 경기 전광판
    @ViewBuilder
    private func scoreDisplayBoard() -> some View {
        HStack{
            AsyncImage(url: URL(string: match.teams.home.logo)) { image in
                image
                    .resizable()

            } placeholder: {
                Image(systemName: "arrow.circlepath")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(RoundedRectangle(cornerRadius: 25.0))
                    .foregroundStyle(.gray)
            }
            .frame(width: 100, height: 140)

            Spacer()
            
            if let long = match.fixture.status.long, long == "Match Finished" {
                Text("\(match.goals.home ?? 0) : \(match.goals.away ?? 0)")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
            } else {
                Text("VS")
                    .foregroundColor(.black)
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }
            
            
            Spacer()
            
            AsyncImage(url: URL(string: match.teams.away.logo)) { image in
                image
                    .resizable()
            } placeholder: {
                Image(systemName: "arrow.circlepath")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .background(RoundedRectangle(cornerRadius: 25.0))
                    .foregroundStyle(.gray)
            }
            .frame(width: 100, height: 140)
            
        }// HStack
    }
    
    @ViewBuilder
    private func displayBoard() -> some View {
        VStack(alignment: .center, spacing: 15) {
            if let referee = match.fixture.referee {
                HStack {
                    Text("referee:")
                        .bold()
                    Spacer()
                    Text("\(referee)")
                        .bold()
                }
                .padding()
            }
            
            if let name = match.fixture.venue.name, let city = match.fixture.venue.city {
                HStack {
                    Text("location:")
                        .bold()
                    Spacer()
                    
                    VStack {
                        
                        Text(name)
                        Text(city)
                    }
                }
                .padding()
            }
                        
            if let home = viewModel.selectedFixtureStatistics.first, let away = viewModel.selectedFixtureStatistics.last {
                HStack {
                    ForEach(home.statistics, id: \.type) { stat in
                        if let type = stat.type, let val = stat.value {
                            Text("\(type): \(val)")
                        }
                    }
                    
                    ForEach(away.statistics, id: \.type) { stat in
                        if let type = stat.type, let val = stat.value {
                            Text("\(type): \(val)")
                        }
                    }
                }
            } else {
                Text("통계 미제공")
            }
            
            //StatisBoard()
        }
        .padding()
    }
    
    // MARK: - StatisBoard
    // 통계
    @ViewBuilder
    private func StatisBoard() -> some View {
        let shootingData : [ChartData] = [
            ChartData(department: "home", profit: 2, category: "shooting"),
            ChartData(department: "away", profit: 2, category: "shooting"),
        ]
        
        let poulData: [ChartData] = [
            ChartData(department: "home", profit: 2, category: "poul"),
            ChartData(department: "away", profit: 3, category: "poul"),
        ]
        
        VStack{
            HStack{
                Text("2")
                    .font(.title)
                    .fontWeight(.bold)
                Spacer()
                Text("파울")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                Text("3")
                    .font(.title)
                    .fontWeight(.bold)
            }
            .padding()
            
            Chart(poulData){
                BarMark(
                    x: .value("Profit", $0.profit),
                    stacking: .center
                )
                .foregroundStyle(by: .value("team", $0.department))
                
            }.frame(height: 50)
            
        }//Vstack
        
        Divider()
        
        HStack{
            Text("2")
                .font(.title)
                .fontWeight(.bold)
            Spacer()
            Text("공격 포인트")
                .font(.title)
                .fontWeight(.semibold)
            Spacer()
            Text("3")
                .font(.title)
                .fontWeight(.bold)
        }
        .padding()
        
    }
}

//#Preview {
//    MatchDetailView()
//}
