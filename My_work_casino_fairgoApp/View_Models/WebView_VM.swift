//
//  WebView_VM.swift
//  Casino
//
//  Created by Muhammad Farid Ullah on 14/08/2022.
//

import Foundation
import SwiftUI
import UIKit
import WebKit

class WebViewModel: ObservableObject {
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

struct WebViewContainer: UIViewRepresentable {
    @ObservedObject var webViewModel: WebViewModel
  
    func makeCoordinator() -> WebViewContainer.Coordinator {
        Coordinator(self, webViewModel)
    }
    
    @State var html_string_request: String
    @State var fontSize: Int
    
    func makeUIView(context: Context) -> WKWebView {
        let fontSetting = "<span style=\"font-size: \(fontSize)\"</span>"
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        webView.loadHTMLString(fontSetting + html_string_request, baseURL: nil)
      
        webView.scrollView.isScrollEnabled = false
        
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if webViewModel.shouldGoBack {
            uiView.goBack()
            webViewModel.shouldGoBack = false
        }
    }
}
extension WebViewContainer {
    class Coordinator: NSObject, WKNavigationDelegate {
        @ObservedObject private var webViewModel: WebViewModel
        private let parent: WebViewContainer
        
        init(_ parent: WebViewContainer, _ webViewModel: WebViewModel) {
            self.parent = parent
            self.webViewModel = webViewModel
        }
        
        func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
            webViewModel.isLoading = true
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            webViewModel.isLoading = false
            webViewModel.title = webView.title ?? ""
            webViewModel.canGoBack = webView.canGoBack
            webViewModel.containerHeight = webView.scrollView.contentSize.height
        }
        
        func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
            webViewModel.isLoading = false
        }
    }
}
