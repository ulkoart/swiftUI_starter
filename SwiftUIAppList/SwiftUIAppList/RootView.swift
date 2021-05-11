//
//  ContentView.swift
//  SwiftUIAppList
//
//  Created by user on 11.05.2021.
//  Copyright © 2021 ulkoart. All rights reserved.
//

import SwiftUI
import Combine

struct RootView: View {
    
    @State private var selection = 0

    var body: some View {
        
        TabView(selection: $selection) {
            StartView()
                .tabItem {
                    VStack {
                        Text("Start")
                        Image(systemName: "bolt")
                    }
                }
                .tag(0)
            FoodListView()
                .tabItem {
                    VStack {
                        Text("Food")
                        Image(systemName: "suit.heart")
                    }
                }
                .tag(1)
            AboutView()
                .tabItem {
                    VStack {
                        Text("About")
                        Image(systemName: "star")
                    }
                }
                .tag(2)
        }
        
        
        
    }
}


// MARK: - Views

struct StartView: View {
    
    var body: some View {
        Text("Start Page")
    }
    
}

struct AboutView: View {
    
    @State private var showAuthors: Bool = false
    
    var body: some View {
        Button(action: {
            self.showAuthors = true
        }) {
            Text("Show Authors")
        }.sheet(isPresented: self.$showAuthors,  onDismiss: { print("Authors dismissed") }) {
            AboutAuthorsModal()
        }
    }
}

struct AboutAuthorsModal: View {
 
    var body: some View {
        Text("🐶")
            .font(.largeTitle)
    }
}
