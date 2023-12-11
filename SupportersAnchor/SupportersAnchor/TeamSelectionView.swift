//
//  ContentView.swift
//  SupportersAnchor
//
//  Created by 최준현 on 12/7/23.
//

import SwiftUI

struct TeamSelectionView: View {
    
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
                        RoundedRectangle(cornerRadius: 8.0)
                            .foregroundStyle(Color(.appPurple))
                        Text("관심있는 팀 선택")
                            .foregroundStyle(.white)
                            .fontWeight(.bold)
                            .padding()
                    }
                    .padding()
                    
                    LazyVGrid(columns: gridItems, spacing: 10){
                        ForEach(1...20, id: \.self){ index in
                            NavigationLink{
                                //destination
                                //MainView()
                            } label:{
                                
                                VStack{
                                    ZStack{
                                        RoundedRectangle(cornerRadius: 25.0)
                                            .frame(width: 110, height: 120)
                                            .foregroundStyle(Color.gray1)
                                        
                                        
                                        AsyncImage(url: URL(string:"")) { image in
                                            
                                        } placeholder: {
                                            Image(systemName: "arrow.circlepath")
                                                .resizable()
                                                .aspectRatio(contentMode: .fit)
                                                .foregroundStyle(.black)
                                                .padding()
                                        }

                                    }
                                    Text("name")
                                        .font(.title3)
                                        .foregroundStyle(.black)
                                        .fontWeight(.regular)
                                }
                            }//NavigationLink
                        }//ForEach
                    }//LazyVGrid
                }
                
                .background(Color.graybackground)
                .padding()
            }//ScrollView
            
        }// NavigationStack
        
    }
}

#Preview {
    TeamSelectionView()
}
