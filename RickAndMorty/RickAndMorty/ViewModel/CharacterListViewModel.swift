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
    
    @Published private(set) var characters = [Character]()
    @Published private(set) var dataLoading: Bool = false
    private var page: Int = 1
    
    init() {
        self.loadCharacters()
    }
    
    func loadCharacters() {
        self.dataLoading = true
        RickAndMortyAPI.charactersGet(page: page) { characters, error in
            guard let characters = characters else { return }
            self.appendCharacters(characters)
        }
    }
    
    func loadMoreCharacters() {
        self.page += 1
        self.loadCharacters()
    }
    
    func isCharacterLast(_ character: Character) -> Bool {
        guard
            let index = self.characters.firstIndex(where: { $0.id == character.id})
        else { return false }
        return index == self.characters.endIndex - 1
    }
       
    private func appendCharacters(_ characters: [Character]) {
        DispatchQueue.main.async {
            self.characters.append(contentsOf: characters)
            self.dataLoading = false
        }
    }
}
