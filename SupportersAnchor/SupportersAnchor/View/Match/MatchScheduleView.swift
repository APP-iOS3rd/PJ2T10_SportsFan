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
    @StateObject private var newsAPI = NewsAPI.shared
    
    var leagueID: String
    var teamID: String
    
    var newsQuery: String {
        switch teamID {
        case "33":
            return "맨유"
        case "39":
            return "울버햄프턴 원더러스"
        default:
            return  "EPL"
        }
    }
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading, spacing: 15) {
                recentMatch() // 최근 경기
                
                mainMatchSchedule() // 경기 일정
                
                mainNews() // 뉴스
            }
        }
        .onAppear {
            matchAPI.moreFetch(leagueID: leagueID, season: "2023", teamID: teamID)
            newsAPI.requestSearchNewsList(query: newsQuery)
        }
    }
    
    // MARK: - recentMatch
    @ViewBuilder
    private func recentMatch() -> some View {
        // MARK: - header
        HStack(alignment: .center, spacing: 5) {
            Text("이번 주 매치")
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
                .frame(width: 200, height: 100)
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
                           //.navigationTitle("경기일정")
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
                .frame(width: 200, height: 100)
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
            
            NavigationLink(destination: NewsListView()
            
            ) {
                Text("더 보기")
                    .bold()
                    .foregroundColor(.black)
            }
        } // HStack
        .padding(.horizontal)
        
        Divider()
        
        // MARK: - 뉴스 리스트
        ForEach(newsAPI.newsList.prefix(4), id: \.self) { news in
            Text(removeTags(news.title))
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
    
    // MARK: - removeTags
    func removeTags(_ text: String) -> String {
        let processedText = text.replacingOccurrences(of: #"<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>"#, with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "&quot;", with: "\"")
        
        return processedText
    }
    
}

//struct MatchSatis: View {
//    @EnvironmentObject private var viewModel: MatchScheduleViewModel
//    
//    var body: some View {
//        VStack(alignment: .center, spacing: 10) {
//            if let home = viewModel.selectedFixtureStatistics.first, let away = viewModel.selectedFixtureStatistics.last {
//                HStack {
//                    fetchImage(url: home.team.logo)
//                    
//                    fetchImage(url: away.team.logo)
//                }
//                
//                HStack {
//                    //                    ForEach(home.statistics, id: \.type) { stat in
//                    //                        Text(stat.type)
//                    //                    }
//                    //
//                    //                    ForEach(away.statistics, id: \.type) { stat in
//                    //                        Text(stat.type)
//                    //                    }
//                }
//            } else {
//                Text("통계 미제공")
//            }
//        }
//    }
//    
//    func fetchImage(url: String) -> some View {
//        ZStack{
//            RoundedRectangle(cornerRadius: 25.0)
//                .foregroundStyle(Color.white)
//            AsyncImage(url: URL(string: url)) { image in
//                image.resizable()
//            } placeholder: {
//                Image(systemName: "arrow.circlepath")
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .padding()
//            }
//        }
//        .frame(width: 96, height: 129)
//    }
//}

#Preview {
    MatchScheduleView(leagueID: "39", teamID: "33")
}
