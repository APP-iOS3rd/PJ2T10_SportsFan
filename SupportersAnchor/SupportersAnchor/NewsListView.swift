//
//  NewsListView.swift
//  SupportersAnchor
//
//  Created by seongjun on 2023/12/11.
//

import SwiftUI

struct NewsListView: View {
//    let newsItems: [News] = [
//        News(title: "첫 번째 뉴스 제목", imageName: "news1"),
//        News(title: "두 번째 뉴스 제목", imageName: "news2"),
//        News(title: "세 번째 뉴스 제목", imageName: "news3")
//    ]
    
    @ObservedObject var newsAPI = NewsAPI.shared
    
    func removeTags(_ text: String) -> String {
        var processedText = text.replacingOccurrences(of: #"<(\/)?([a-zA-Z]*)(\s[a-zA-Z]*=[^>]*)?(\s)*(\/)?>"#, with: "", options: .regularExpression, range: nil).replacingOccurrences(of: "&quot;", with: "\"")
        
        return processedText
    }
        
        var body: some View {
            VStack {
                List(newsAPI.newsList, id: \.self) { news in
                    VStack(alignment: .leading) {
                        Text(removeTags(news.title))
                            .font(.headline)
                        Text(removeTags(news.description))
                            .font(.subheadline)
                            .foregroundColor(.gray)
                    }
                }
            }    .onAppear() {
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
