//
//  ContentView.swift
//  TestOpenWebsite
//
//  Created by Hualiteq International on 2025/12/30.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            // 1st
            Link("Open Google", destination: URL(string: "https://www.google.com")!)
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

#Preview {
    ContentView()
}
