//
//  TeamSelectionViewItem.swift
//  SupportersAnchor
//
//  Created by 최준현 on 12/12/23.
//

import SwiftUI

struct TeamSelectionViewItem: View {
    let url : String
    let name: String
    var body: some View {
        VStack{
            ZStack{
                RoundedRectangle(cornerRadius: 25.0)
                    .frame(width: 110, height: 120)
                    .foregroundStyle(Color.gray1)
                
                AsyncImage(url: URL(string: "\(url)")) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width:100,height:100)
                        
                    
                } placeholder: {
                    Image(systemName: "arrow.circlepath")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                }

            }
            Text("\(name)")
                .font(.caption)
                .foregroundStyle(.black)
                .fontWeight(.semibold)
        }
    }
}

#Preview {
    TeamSelectionViewItem(url: "https://media-4.api-sports.io/football/venues/562.png" , name: "Manchester United")
}
