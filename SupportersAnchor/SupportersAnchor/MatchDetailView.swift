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
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    AsyncImage(url: URL(string: "")) { image in
                        
                    } placeholder: {
                        Image(systemName: "arrow.circlepath")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .background(RoundedRectangle(cornerRadius: 25.0))
                            .foregroundStyle(.gray)
                    }
                    
                    Text("3-3")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    AsyncImage(url: URL(string: "")) { image in
                        
                    } placeholder: {
                        Image(systemName: "arrow.circlepath")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .background(RoundedRectangle(cornerRadius: 25.0))
                            .foregroundStyle(.gray)
                    }
                    
                }// HStack
                
                HStack{
                    
                    VStack(spacing:20){
                        Text("손흥민(자책) 6'")
                            .fontWeight(.semibold)
                            
                        Text("필 포든 9'")
                            .fontWeight(.semibold)
                            
                        Text("잭 그릴리쉬 31'")
                            .fontWeight(.semibold)
                    }
            
                    Spacer()
                    
                    VStack(spacing:20){
                        Text("손흥민(자책) 23'")
                            .fontWeight(.semibold)
                        Text("필 포든 9'")
                            .fontWeight(.semibold)
                        Text("잭 그릴리쉬 31'")
                            .fontWeight(.semibold)
                    }
                }//HSatack
                .padding()
                
                Divider()
                
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
                        Text("유효 슈팅")
                            .font(.title)
                            .fontWeight(.semibold)
                        Spacer()
                        Text("2")
                            .font(.title)
                            .fontWeight(.bold)
                    }
                    .padding()
                    
                    Chart(shootingData) {
                        BarMark(
                            x: .value("Profit", $0.profit),
                            stacking: .center
                        )
                        .foregroundStyle(by: .value("team", $0.department))
                    }
                    
                    .frame(height: 50)
                    
                    ProgressView(value: 2, total: 4)
                        .tint(.blue)
                        .background(.green)
                }//VStack

                
                Divider()
                
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
                    
            } //VStack
            .padding()
        }
        .navigationTitle("12.04월(01:30")
    }
}

#Preview {
    MatchDetailView()
}
