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
    let matchId: Int
    
    var body: some View {
        NavigationStack{
            ScrollView {
                VStack(alignment: .center, spacing: 15) {
                    HStack(alignment: .center, spacing: 0){
                        Text(match.fixture.date.formatDateString())
                            .font(.headline)
                            .foregroundColor(.black)
                        Spacer()
                    }
                    
                    scoreDisplayBoard()
                    
                    Divider()
                        .padding()
                    
                    displayBoard()
                    
                    Divider()
                        .padding()
                    
                    timeLine()
                    
                    
                } //VStack
                .padding()
            }
        }
        .onAppear {
            viewModel.fetchEventssData(fixtureID: "\(matchId)")
        }
        //.navigationTitle(viewModel.selectedFixture.fixture.date)
    }
    
    // MARK: - ViewBuilder
    // ...
    // MARK: - scoreDisplayBoard
    // 경기 전광판
    @ViewBuilder
    private func scoreDisplayBoard() -> some View {
        HStack {
            // 홈
            VStack {
                // 로고
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
                .frame(width: 100, height: 140) // 로고
                
                Spacer()
                
                // 득점
                if viewModel.isInGoal(match.teams.home.name) {
                    ForEach(viewModel.selectedFixturesEvents, id: \.id) { events in
                        if let eventsType = events.type, eventsType == "Goal", events.team.name == match.teams.home.name  {
                            HStack {
                                if let elapsed = events.time.elapsed {
                                    Text("\(elapsed)")
                                        .font(.system(size: 12, weight: .regular))
                                }
                                if let _ = events.player.id {
                                    Text(events.player.name ?? "")
                                        .font(.system(size: 12, weight: .regular))
                                        .lineLimit(1)
                                }
                            }.padding(.horizontal)
                        }
                    }
                } else {
                    Spacer()
                } // 득점
            } // VStack
            
            Spacer()
            
            // 스코어
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
            
            // 어웨이
            VStack {
                // 로고
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
                .frame(width: 100, height: 140) // 로고
                
                Spacer()
                
                // 득점
                if viewModel.isInGoal(match.teams.away.name) {
                    ForEach(viewModel.selectedFixturesEvents, id: \.id) { events in
                        if let eventsType = events.type, eventsType == "Goal", events.team.name == match.teams.away.name  {
                            HStack {
                                if let elapsed = events.time.elapsed {
                                    Text("\(elapsed)")
                                        .font(.system(size: 12, weight: .regular))
                                }
                                if let _ = events.player.id {
                                    Text(events.player.name ?? "")
                                        .font(.system(size: 12, weight: .regular))
                                        .lineLimit(1)
                                }
                            }.padding(.horizontal)
                        }
                    }
                } else {
                    Spacer()
                } // 득점
            } // VStack
        }
        .padding(.horizontal)
    }
    
    // MARK: - displayBoard
    @ViewBuilder
    private func displayBoard() -> some View {
        VStack(alignment: .center, spacing: 0) {
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
                    Text(city)
                    
                }
                .padding()
            }
        }
        .padding(.horizontal)
    }
    
    @ViewBuilder
    private func timeLine() -> some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: [GridItem(.flexible())], spacing: 10) {
                ForEach(viewModel.selectedFixturesEvents, id: \.id) { events in
                    if let eventsType = events.type {
                        VStack(alignment: .center, spacing: 5) {
                            if let elapsed = events.time.elapsed {
                                Text("\(elapsed)")
                            } else if let _ = events.assist.id {
                                Text("\(events.time.elapsed ?? 0)")
                                    .font(.system(size: 12, weight: .regular))
                                    .lineLimit(1)
                            } else {
                                Spacer()
                            }
                            
                            if let _ = events.team.id {
                                fetchImage(url: events.team.logo ?? "")
                                    .lineLimit(1)
                            } else {
                                Spacer()
                            }
                            
                            Text(eventsType)
                            
                            if let _ = events.assist.id {
                                Text(events.assist.name ?? "")
                                    .font(.system(size: 12, weight: .regular))
                                    .lineLimit(1)
                            } else {
                                Spacer()
                            }
                            
                            if let _ = events.player.id {
                                Text(events.player.name ?? "")
                                    .font(.system(size: 12, weight: .regular))
                                    .lineLimit(1)
                            } else {
                                Spacer()
                            }
                        }
                    }
                }
            }.padding(.horizontal)
        }.padding(.horizontal)
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
    
    // MARK: fetchImage
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
        .frame(width: 30, height: 30)
    }
}

