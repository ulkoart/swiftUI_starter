//
//  CharacterListViewModel.swift
//  RickAndMorty
//
//  Created by user on 08/06/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation

protocol CharacterViewModelProtocol {}

final class CharacterListViewModel: ObservableObject, CharacterViewModelProtocol {
    
    private(set) var characters = [Character]()
    
    init() {
        print("\(self) - \(#function)")
        self.loadCharacters()
    }
    
    func loadCharacters() {
        print(#function)
        RickAndMortyAPI.charactersGet() { characters, error in
            guard let characters = characters else { return }
            self.characters = characters
            
        }
    }
}
