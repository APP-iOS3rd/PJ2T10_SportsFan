//
//  OnboardingView1.swift
//  SupportersAnchor
//
//  Created by 박호건 on 12/12/23.
//

import SwiftUI

struct OnboardingView1: View {
    var body: some View {
        NavigationView{
            ZStack {
                Image("BackgroundImage")
                    .resizable()
                    .ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    Text("Ducks")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.black)
                    Spacer()
                    Text("우린 서포터즈입니다.")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                    Text("좋아하는 축구팀을 팔로우 하세요!")
                        .padding()
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                    NavigationLink(destination: LeagueSelectionView().navigationBarBackButtonHidden(true)) {
                        Text("시작하기")
                            .padding()
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 200)
                            .background(.black)
                            .cornerRadius(10)
                    }
                    
                }
            }
        }
    }
}


#Preview {
    OnboardingView1()
}
