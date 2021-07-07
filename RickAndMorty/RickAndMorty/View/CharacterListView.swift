//
//  CharacterListView.swift
//  RickAndMorty
//
//  Created by user on 08/06/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import SwiftUI


struct CharacterListCellView: View {
    let character: Character
    let dataLoading: Bool
    let isCharacterLast: Bool
    
    var body: some View {
        return VStack {
            NavigationLink(destination: CharacterView(character: character)) {
                VStack(alignment: .leading) {
                    Text(character.name)
                        .font(.headline)
                    Text(character.species)
                }
            }
            if dataLoading && isCharacterLast {
                ActivityIndicator(isAnimating: .constant(true), style: .large)
            }
        }

    }
}

struct CharacterListView: View {
    
    @EnvironmentObject var viewModel: CharacterListViewModel
    
    init() {
        UITableView.appearance().showsVerticalScrollIndicator = false
    }
    
    var body: some View {
        NavigationView {
            List { characters }
                .navigationBarTitle("Персонажи")
        }
    }
    
    var characters: some View {
        return ForEach(viewModel.characters) { character in
            VStack {
                CharacterListCellView(
                    character: character, dataLoading: self.viewModel.dataLoading, isCharacterLast: self.viewModel.isCharacterLast(character)
                )
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
