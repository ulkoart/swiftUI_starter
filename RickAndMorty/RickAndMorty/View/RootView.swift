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
    
    @EnvironmentObject var router: Router
    @EnvironmentObject var characterListViewModel: CharacterListViewModel
       
    var body: some View {
        TabView(selection: $router.tabSelection) {
            CharacterListView()
                .environmentObject(characterListViewModel)
                .tabItem {
                    Image(systemName: "person.3")
            }
            .tag(0)
            LocationListView()
                .tabItem {
                    Image(systemName: "location")
            }
            .tag(1)
            EpisodeListView()
                .tabItem {
                    Image(systemName: "film")
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
