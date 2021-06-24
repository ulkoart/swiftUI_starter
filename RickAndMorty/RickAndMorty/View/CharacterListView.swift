//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by user on 08/06/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import SwiftUI

struct CharacterListView: View {
    
    @EnvironmentObject var viewModel: CharacterListViewModel
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        NavigationView {
            List {
                characters
            }
            .navigationBarTitle("Персонажи")
        }
    }
    
    var characters: some View {
        ForEach(viewModel.characters) { character in
            VStack {
                NavigationLink(destination: CharacterView(character: character)) {
                    VStack(alignment: .leading) {
                        Text(character.name)
                            .font(.headline)
                        Text(character.species)
                    }
                }
                if self.viewModel.dataLoading && self.viewModel.isCharacterLast(character) {
                    ActivityIndicator(isAnimating: .constant(true), style: .large)
                }
            }
            .onAppear {
                if self.viewModel.isCharacterLast(character) {
                    self.viewModel.loadMoreCharacters()
                }
            }
        }
        
    }
    
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView().environmentObject(CharacterListViewModel())
    }
}
