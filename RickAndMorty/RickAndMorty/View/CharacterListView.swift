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
                    Text(character.name)
                }
            }
            .navigationBarTitle("Персонажи")
        }
    }
}

struct PersonListView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterListView()
    }
}
