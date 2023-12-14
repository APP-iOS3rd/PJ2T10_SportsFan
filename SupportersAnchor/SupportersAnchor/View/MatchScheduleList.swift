//
//  MatchScheduleList.swift
//  SupportersAnchor
//
//  Created by lkh on 12/13/23.
//

import SwiftUI

// MARK: - MatchScheduleList
// 
struct MatchScheduleList: View {
    @EnvironmentObject private var viewModel: MatchScheduleViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                ForEach(viewModel.fixtures.prefix(10), id: \.fixture.id) { match in
                    VStack(alignment: .center, spacing: 15) {
                        if let long = match.fixture.status.long, long == "Match Finished" {
                            Button(action: {
                                viewModel.selectFixture(fixture: match)
                            }) {
                                NavigationLink(
                                    destination: MatchDetailView(match: match, matchId: match.fixture.id)
                                        .environmentObject(viewModel)
                                ) {
                                    MatchScheduleItem(fixture: match)
                                }
                            }
                        } else {
                            MatchScheduleItem(fixture: match)
                            
                        }
                        Divider()
                    }
                    .padding()
                }
            }
        }
    }
}
