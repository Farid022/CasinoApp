//
//  WebView_VM2.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 14/08/2022.
//

import Foundation
import SwiftUI
import UIKit
import WebKit

class WebViewModel2: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var canGoBack: Bool = true
    @Published var shouldGoBack: Bool = false
    @Published var title: String = ""
    
    @Published var containerHeight: CGFloat = 100
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
}

struct WebViewContainer2: UIViewRepresentable {
    @ObservedObject var webViewModel2: WebViewModel2
    
  
    func makeCoordinator() -> WebViewContainer2.Coordinator {
        Coordinator(self, webViewModel2)
    }
    
    @State var html_string_request: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.loadHTMLString(html_string_request, baseURL: nil)
      
        webView.scrollView.isScrollEnabled = false
        
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if webViewModel2.shouldGoBack {
            uiView.goBack()
            webViewModel2.shouldGoBack = false
        }
    }
}
extension WebViewContainer2 {
    class Coordinator: NSObject, WKNavigationDelegate {
        @ObservedObject private var webViewModel2: WebViewModel2
        private let parent: WebViewContainer2
        
        init(_ parent: WebViewContainer2, _ webViewModel2: WebViewModel2) {
            self.parent = parent
            self.webViewModel2 = webViewModel2
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            webViewModel2.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webViewModel2.isLoading = false
            webViewModel2.title = webView.title ?? ""
            webViewModel2.canGoBack = webView.canGoBack
            webViewModel2.containerHeight = webView.scrollView.contentSize.height
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            webViewModel2.isLoading = false
        }
    }
}
