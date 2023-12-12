//
//  MatchScheduleView.swift
//  SupportersAnchor
//
//  Created by lkh on 12/7/23.
//

import SwiftUI

struct MatchScheduleView: View {
    @StateObject private var viewModel = MatchScheduleViewModel()
    
    var leagueID: String
    var teamID: String
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 5) {
                // MARK: - header
                HStack(alignment: .center, spacing: 5) {
                    Text("이번 주 매치")
                        .font(.title)
                        .bold()
                    Spacer()
                    
                }.padding(.horizontal)
                
                Divider()
                
                // MARK: - 이번주 매치
                if let match = viewModel.fixtures.first {
                    MatchScheduleItem(fixture: match)
                }
                
                // MARK: - header
                HStack(alignment: .center, spacing: 5) {
                    Text("경기일정")
                        .font(.title)
                        .bold()
                    
                    Spacer()
                    
                    NavigationLink(destination: MatchScheduleList()
                        .environmentObject(viewModel)
                        .navigationTitle("경기일정")
                    ) {
                        Text("더 보기")
                            .bold()
                            .foregroundColor(.black)
                    }
                }.padding(.horizontal)
                Divider()
                
                // MARK: - 경기일정
                ForEach(viewModel.fixtures.prefix(4), id: \.fixture.id) { fixture in
                    HStack(alignment: .center, spacing: 5) {
                        Text(fixture.fixture.date.formatDateString())
                            .font(.headline)
                        
                        fetchImage(url: fixture.teams.home.logo)
                        Text(fixture.teams.home.name)
                        
                        fetchImage(url: fixture.teams.away.logo)
                        Text(fixture.teams.away.name)
                    }
                }
                .padding()
            }
        }
        .onAppear {
            viewModel.moreFetch(leagueID: leagueID, season: "2023", teamID: teamID)
        }
    }
    
    // MARK: fetchImage
    func fetchImage(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 20, height: 20)}
}


// MARK: - MatchScheduleList
struct MatchScheduleList: View {
    @EnvironmentObject private var viewModel: MatchScheduleViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.fixtures.prefix(4), id: \.fixture.id) { match in
                    Text(match.fixture.date)
                    
                    
                    NavigationLink(destination: MatchSatis()) {
                        MatchScheduleItem(fixture: match)
//                            .onTapGesture {
//                                viewModel.selectFixture(fixture: match)
//                            }
                    }
                    
                    Divider()
                }
                .padding()
                
            }
        }
    }
}

// MARK: - MatchScheduleItem
// 리스트 셀 또는 한 경기 정보
struct MatchScheduleItem: View {
    let fixture: FixtureData
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HStack(alignment: .center, spacing: 0) {
                Text(fixture.fixture.date)
                    .font(.headline)
                Spacer()
            }
            
            HStack(alignment: .center, spacing: 10) {
                VStack(alignment: .center, spacing: 15) {
                    fetchImage(url: fixture.teams.home.logo)
                    Text("\(fixture.teams.home.name)")
                }
                
                Spacer()
                
                VStack(alignment: .center, spacing: 15) {
                    fetchImage(url: fixture.teams.away.logo)
                    Text("\(fixture.teams.away.name)")
                }
            }
        }
        .padding()
    }
    
    func fetchImage(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 96, height: 129)
    }
}

struct MatchSatis: View {
    @StateObject private var viewModel = MatchScheduleViewModel()

    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            if let ele = viewModel.selectedDetails.first {
                fetchImage(url: ele.team.logo)
                Text(ele.team.name)
                
                if let home = ele.statistics.first {
                    Text(home.type ?? "")
                }
            }
        }.onAppear {
            viewModel.fetchStatisticsData(fixtureID: "1035046")
        }
        .padding()
    }

    func fetchImage(url: String) -> some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 96, height: 129)
    }
}

#Preview {
    MatchScheduleView(leagueID: "33", teamID: "39")
}
