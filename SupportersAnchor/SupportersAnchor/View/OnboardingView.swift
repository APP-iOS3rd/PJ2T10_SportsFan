//
//  OnboardingView.swift
//  SupportersAnchor
//
//  Created by 박호건 on 12/9/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        NavigationView{
        ZStack {
            Image("BackgroundImage")
                .resizable()
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                    Spacer()
                    Text("Ducks")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.black)
                    Text("해외축구 서포터즈를 위한 정보 앱")
                        .padding()
                        .font(.system(size: 30, weight: .bold))
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    Spacer()
                NavigationLink(destination: OnboardingView1().navigationBarBackButtonHidden(true)){
                        Text("다음")
                            .font(.system(size: 30, weight: .bold))
                            .padding()
                            .frame(width: 200)
                            .foregroundColor(.white)
                            .background(.black)
                            .cornerRadius(10)
                    }
                    
                }
            }
        }
    }
}

#Preview {
    OnboardingView()
}
