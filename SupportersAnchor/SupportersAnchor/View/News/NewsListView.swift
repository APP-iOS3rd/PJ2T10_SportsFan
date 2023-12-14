//
//  NewsListView.swift
//  SupportersAnchor
//
//  Created by seongjun on 2023/12/11.
//

import SwiftUI
import WebKit

struct NewsListView: View {
    @ObservedObject private var viewModel: NewsViewModel = NewsViewModel.shared
    @State private var selectedNewsURL: String?
    
    let qurey: String
    
    func removeTags(_ text: String) -> String {
        let processedText = text.replacingOccurrences(of: #"<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>"#, with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "&quot;", with: "\"")
        
        return processedText
    }
    
    var body: some View {
        Text("")
        VStack {
            List(viewModel.newsList, id: \.self) { news in
                NavigationLink(destination: NewsWebView(urlToLoad: news.url)) {
                    // cell
                    HStack {
                        AsyncImage(url: URL(string: news.urlToImage ?? "")) { image in
                            image
                                .resizable()
                                .frame(width: 150, height: 120)
                                .aspectRatio(contentMode: .fit)
                                .clipped()
                                .cornerRadius(10)
                        } placeholder: {
                            Image("free-icon-gallery")
                                .resizable()
                                .frame(width: 150, height: 120)
                                .aspectRatio(contentMode: .fit)
                                .cornerRadius(8)
                                .redacted(reason: .placeholder)
                        }
                        VStack {
                            Text(news.title)
                                .font(.system(size: 15, weight: .bold))
                                .fontWeight(.bold)
                                .bold()
                                .lineLimit(2) // 한줄로 제한
                            
                            Spacer()
                            
                            // 요약
                            Text(news.description ?? "")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(.black)
                                .lineLimit(2)
                        }.padding()
                    } // Hstack
                }
            }
        }
        .onAppear {
            Task {
                do {
                    try await viewModel.fetchPostNews(qurey)
                } catch (let error) {
                    print("\(error)")
                }
            }
        }
    }
}

//#Preview {
//    NewsListView()
//}
