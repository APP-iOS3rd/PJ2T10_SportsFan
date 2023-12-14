//
//  NewsWebView.swift
//  SupportersAnchor
//
//  Created by seongjun on 2023/12/11.
//

import SwiftUI
import WebKit

struct NewsWebView: View {
    let url: String

    var body: some View {
        WebViewContainer(urlString: url)
            .edgesIgnoringSafeArea(.all)
    }
}

struct WebViewContainer: UIViewRepresentable {
    let urlString: String

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}

//#Preview {
//    NewsWebView()
//}

