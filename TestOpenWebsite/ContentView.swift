//
//  ContentView.swift
//  TestOpenWebsite
//
//  Created by Hualiteq International on 2025/12/30.
//

import SwiftUI
import WebKit
import SafariServices

struct ContentView: View {
    @State private var showWebView = false
    @State private var showSafari = false
    
    var body: some View {
        VStack {
            Button("Open Website in App") {
                        showSafari = true
                    }
                    .buttonStyle(.borderedProminent)
                    .sheet(isPresented: $showSafari) {
                        SafariView(url: URL(string: "https://localrec.hualiteq.com/client-recording")!)
                    }
            
            Button("Open Website") {
                showWebView = true
            }
            .sheet(isPresented: $showWebView) {
                WebView(url: URL(string: "https://localrec.hualiteq.com/client-recording")!)
            }
            
            // 1st
            Link("Open Nginx", destination: URL(string: "https://localrec.hualiteq.com/client-recording")!)
                .buttonStyle(.borderedProminent)
                .padding()
            
            // 2nd
            Button("Open Apple") {
                if let url = URL(string: "https://www.apple.com") {
                    UIApplication.shared.open(url)
                }
            }
            .buttonStyle(.bordered)
            .padding()
            
            // 3rd
            OpenURLButton()
               
            
        }
        .padding()
    }
}

struct SafariView: UIViewControllerRepresentable {
    let url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
}

struct OpenURLButton: View {
    @Environment(\.openURL) var openURL
    
    var body: some View {
        Button("Open GitHub") {
            if let url = URL(string: "https://www.github.com") {
                openURL(url)
            }
        }
        .buttonStyle(.borderedProminent)
        .tint(.purple)
        .padding()
    }
}

struct  WebView: UIViewRepresentable {
    let url: URL
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        let request = URLRequest(url: url)
        uiView.load(request)
    }
    
}

#Preview {
    ContentView()
}
