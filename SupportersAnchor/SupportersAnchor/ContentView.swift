//
//  ContentView.swift
//  SupportersAnchor
//
//  Created by 최준현 on 12/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello")
                 NavigationView {
                     NewsListView()
                         .navigationBarTitle("뉴스")
                 }
    }
}

#Preview {
    ContentView()
}

