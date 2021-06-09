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
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.characters) { character in
                    VStack {
                        Text(character.name)
                    }.onAppear {
                        if self.viewModel.isCharacterLast(character) {
                            self.viewModel.loadMoreCharacters()
                        }
                    }
                }
            }
            .navigationBarTitle("Персонажи")
        }
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView().environmentObject(CharacterListViewModel())
    }
}
