//
//  NewsListView.swift
//  SupportersAnchor
//
//  Created by seongjun on 2023/12/11.
//

import SwiftUI
import WebKit

struct NewsListView: View {
    @ObservedObject var newsAPI = NewsAPI.shared
    @State private var selectedNewsURL: String?

    func removeTags(_ text: String) -> String {
        var processedText = text.replacingOccurrences(of: #"<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>"#, with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "&quot;", with: "\"")
        
        return processedText
    }
        
        var body: some View {
            
            
            VStack {
                List(newsAPI.newsList, id: \.self) { news in
                    NavigationLink(destination: NewsWebView(url: news.originallink), tag: news.originallink, selection: $selectedNewsURL) {
                        VStack(alignment: .leading) {
                            Text(removeTags(news.title))
                                .font(.headline)
                            Text(removeTags(news.description))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                                          }
                                      }.onTapGesture {
                                          selectedNewsURL = news.originallink
                                      }
                }
            }.onAppear() {
                newsAPI.requestSearchNewsList()
            }
        }

//    var body: some View {
//        List(newsItems) { news in
//            HStack {
//                Image(news.imageName)
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 100, height: 100)
//                
//                Text(news.title)
//                    .padding()
//            }
//        }
//    }
}

#Preview {
    NewsListView()
}
