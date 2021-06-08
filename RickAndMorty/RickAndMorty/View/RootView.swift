//
//  ContentView.swift
//  RickAndMorty
//
//  Created by user on 08/06/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import SwiftUI

struct LocationListView: View {
    
    var body: some View {
        NavigationView {
            Text("Locations")
                .navigationBarTitle("Локации")
        }
    }
}

struct EpisodeListView: View {
    
    var body: some View {
        NavigationView {
            Text("Episodes")
                .navigationBarTitle("Серии")
        }
    }
}

struct RootView: View {
    
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            CharacterListView()
                .environmentObject(CharacterListViewModel())
                .tabItem {
                    Image(systemName: "person.3").font(.system(size: 26))
            }
            .tag(0)
            LocationListView()
                .tabItem {
                    Image(systemName: "location").font(.system(size: 26))
            }
            .tag(1)
            EpisodeListView()
                .tabItem {
                    Image(systemName: "film").font(.system(size: 26))
            }
            .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
