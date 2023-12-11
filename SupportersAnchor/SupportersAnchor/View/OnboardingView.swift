//
//  OnboardingView.swift
//  SupportersAnchor
//
//  Created by 박호건 on 12/9/23.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        VStack {
            Spacer()
            Text("우린 서포터즈입니다.")
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.blue)
            Text("좋아하는 축구팀을 팔로우 하세요!")
                .padding()
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.blue)
            
            Spacer()
            
            Button {
                
            } label: {
                Text("시작하기")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(.white)
            }
            .frame(width:250, height: 80)
            .background(.blue)
            .cornerRadius(30)

        }
    }
}

#Preview {
    OnboardingView()
}
