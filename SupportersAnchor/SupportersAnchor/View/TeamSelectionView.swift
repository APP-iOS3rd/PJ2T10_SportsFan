//
//  ContentView.swift
//  SupportersAnchor
//
//  Created by 최준현 on 12/7/23.
//

import SwiftUI

struct TeamSelectionView: View {
    @StateObject var teamSelectionVM = TeamSelectionViewModel()
    
    var gridItems: [GridItem] = [
                        GridItem(),
                        GridItem(),
                        GridItem()
                    ]
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .foregroundStyle(Color(.appPurple))
                        Text("관심있는 팀 선택")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .padding()
                    }
                    .padding()
                    
                    LazyVGrid(columns: gridItems){
                        ForEach(teamSelectionVM.footballTeamList, id: \.self){ teams in
                            NavigationLink{
                                
                            }label:{
                                TeamSelectionViewItem(url: teams.team.logo, name: teams.team.name)
                            }
                        }//ForEach
                    }//LazyVGrid
                }//VStack
               
                .background(Color.graybackground)
                .padding()
                
            }//ScrollView
            .onAppear{
                    teamSelectionVM.getTeams(leagueId: 39)
            }
        }// NavigationStack
        
        
    }
}

#Preview {
    TeamSelectionView()
}
