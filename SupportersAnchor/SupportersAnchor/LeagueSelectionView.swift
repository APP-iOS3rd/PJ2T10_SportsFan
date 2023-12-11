//
//  LeagueSelectionView.swift
//  SupportersAnchor
//
//  Created by 변정훈 on 12/11/23.
//

import SwiftUI

struct LeagueSelectionView: View {
    var body: some View {
        ZStack {
            Rectangle()
              .foregroundColor(.clear)
              .frame(width: 359, height: 746)
              .background(Color(red: 0.95, green: 0.95, blue: 0.95))
              .cornerRadius(12)
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 333, height: 61, alignment: .top)
                    .background(.white)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .inset(by: 0.5)
                            .stroke(Color(red: 0.87, green: 0.87, blue: 0.87), lineWidth: 1)
                    )
                    .overlay { Text("관심있는 리그 선택")
                            .foregroundColor(Color(red: 0.46, green: 0.45, blue: 0.87))
                        .font(.headline)}
                

                HStack{
                    Button(action: {
                        print("")
                    }, label: {
                        Image("EPL")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        //                            .position(x:80 ,y: 150)
                            .padding()
                    })
                    Button(action: {
                        print("")
                    }, label: {
                        Image("LaLiga")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        //                            .position(x:80 ,y: 150)
                            .padding()
                    })
                }
                HStack{
                    Button(action: {
                        print("")
                    }, label: {
                        Image("SerieA")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        //                            .position(x:80 ,y: 10)
                    })
                    Button(action: {
                        print("")
                    }, label: {
                        Image("League1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 100)
                        //                            .position(x:80 ,y: 10)
                    })
                }

            }
            
            .padding()
        }
        .padding()
    }

}

#Preview {
    LeagueSelectionView()
}
