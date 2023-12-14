//
//  LeagueSelectionView.swift
//  SupportersAnchor
//
//  Created by 변정훈 on 12/11/23.
//

import SwiftUI

struct LeagueSelectionView: View {
    @StateObject var leagueSelectionVM = LeagueSelectionViewModel()
    @State var leagueID : Int?
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
                        Text("관심있는 리그 선택")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .padding()
                    }
                    .padding()
                    
                    LazyVGrid(columns: gridItems){
                        ForEach(leagueSelectionVM.footballLeagueList, id: \.self){ leagues in
                            NavigationLink{
                                TeamSelectionView(leagueID: leagues.league.id)
                            }label:{
                                TeamSelectionViewItem(url: leagues.league.logo, name: leagues.league.name)
                            }
                        }//ForEach
                    }//LazyVGrid
                }//VStack
               
                .background(Color.graybackground)
                .padding()
                
            }//ScrollView
            .onAppear{
                leagueSelectionVM.getLeagues()
            }
        }// NavigationStack
        .navigationBarBackButtonHidden(true)
        .tint(.black)
        
        
    }

}

#Preview {
    LeagueSelectionView()
}
