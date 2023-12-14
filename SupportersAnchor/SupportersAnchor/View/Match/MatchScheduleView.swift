//
//  MatchScheduleView.swift
//  SupportersAnchor
//
//  Created by lkh on 12/7/23.
//

import SwiftUI

// MARK: - MatchScheduleView
// 경기, 뉴스 등
struct MatchScheduleView: View {
    @StateObject private var matchAPI = MatchScheduleViewModel()
    @StateObject private var newsAPI = NewsViewModel.shared
    @State private var showingConfirmation = false
    
    var leagueID: String
    var teamID: String
    
    var ourTeamName: String {
        if let fixture = matchAPI.fixtures.first {
            if String(fixture.teams.home.id) == teamID {
                return String(fixture.teams.home.name)
            } else {
                return String(fixture.teams.away.name)
            }
        }
        return "epl"
    }
    
    var ourTeamUrl: String {
        if let fixture = matchAPI.fixtures.first {
            if String(fixture.teams.home.id) == teamID {
                return String(fixture.teams.home.logo)
            } else {
                return String(fixture.teams.away.logo)
            }
        }
        return ""
    }
    
    var newsQuery: String {
        switch teamID {
        case "47":
            return "토트넘"
        case "33":
            return "맨유"
        case "39":
            return "울버햄프턴 원더러스"
        default:
            return  "해외축구"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundStyle(Color.white)
                        AsyncImage(url: URL(string: ourTeamUrl)) { image in
                            image.resizable()
                        } placeholder: {
                            Image(systemName: "arrow.circlepath")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .padding()
                        }
                    }
                    .frame(width: 30, height: 30)
                    
                    Text(ourTeamName)
                        .font(.title)
                        .bold()
                        .lineLimit(1)
                    Spacer()
                        
                    
                    Button{
                        showingConfirmation.toggle()
                    } label: {
                        Text("다시 선택")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                    }.confirmationDialog("화면을 선택해주세요", isPresented: $showingConfirmation) { 
                        NavigationLink("팀 선택으로 이동"){ TeamSelectionView(leagueID: Int(leagueID) ?? 39)}
                        
                        NavigationLink("리그 선택으로 이동") { LeagueSelectionView() }
                    } message:{
                        Text("다시 선택할 팀 혹은 리그")
                    }
                    
                }
                .padding()

                recentMatch() // 최근 경기
                
                mainMatchSchedule() // 경기 일정
                
                mainNews() // 뉴스
            }
            .padding()
        }
        .onAppear {
            matchAPI.moreFetch(leagueID: leagueID, season: "2023", teamID: teamID)
            
            Task {
                do {
                    try await  newsAPI.fetchPostNews(ourTeamName)
                } catch (let error) {
                    print("\(error)")
                }
            }

        }
    }
    
    // MARK: - recentMatch
    @ViewBuilder
    private func recentMatch() -> some View {
        // MARK: - header
        HStack(alignment: .center, spacing: 5) {
            Text("최근 매치")
                .font(.title)
                .bold()
            Spacer()
            
        }.padding(.horizontal)
        
        Divider()
        
        // MARK: - 이번주 매치
        if let match = matchAPI.fixtures.first {
            MatchScheduleItem(fixture: match)
        } else {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(Color.white)
                .frame(width: 100, height: 100)
        }
    }
    
    // MARK: - mainMatchSchedule
    @ViewBuilder
    private func mainMatchSchedule() -> some View {
        // MARK: - header
        HStack(alignment: .center, spacing: 5) {
            Text("경기일정")
                .font(.title)
                .bold()
            
            Spacer()
            
            NavigationLink(destination: MatchScheduleList()
                .environmentObject(matchAPI)
            ) {
                Text("더 보기")
                    .bold()
                    .foregroundColor(.black)
            }
        } // HStack
        .padding(.horizontal)
        
        Divider()
        if let _ = matchAPI.fixtures.first {
            // MARK: - 경기일정
            ForEach(matchAPI.fixtures.prefix(4), id: \.fixture.id) { fixture in
                HStack(alignment: .center, spacing: 5) {
                    Text(fixture.fixture.date.formatDateString())
                        .font(.headline)
                        .lineLimit(1)
                    Spacer()
                    
                    fetchImage(url: fixture.teams.home.logo)
                    Text(fixture.teams.home.name)
                        .lineLimit(1)
                    
                    Spacer()
                    fetchImage(url: fixture.teams.away.logo)
                    Text(fixture.teams.away.name)
                        .lineLimit(1)
                } //HStack
                
            } // ForEach
            .padding(.horizontal)
        } else {
            RoundedRectangle(cornerRadius: 25.0)
                .foregroundStyle(Color.white)
                .frame(width: 100, height: 100)
        }
    }
    
    // MARK: - mainNews
    @ViewBuilder
    private func mainNews() -> some View {
        // MARK: - header
        HStack(alignment: .center, spacing: 5) {
            Text("뉴스")
                .font(.title)
                .bold()
            
            Spacer()
            
            NavigationLink(destination: NewsListView(qurey: ourTeamName)
                .environmentObject(newsAPI)) {
                Text("더 보기")
                    .bold()
                    .foregroundColor(.black)
            }
        } // HStack
        .padding(.horizontal)
        
        Divider()
        
        // MARK: - 뉴스 리스트
        ForEach(newsAPI.newsList.prefix(4), id: \.self) { news in
            Text(news.title)
                .lineLimit(1)
            
        } // ForEach
        .padding(.horizontal)
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
        .frame(width: 20, height: 15)
    }
}

#Preview {
    MatchScheduleView(leagueID: "39", teamID: "33")
}
