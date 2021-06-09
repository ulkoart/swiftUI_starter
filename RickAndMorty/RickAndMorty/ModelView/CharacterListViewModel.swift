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
    private var page: Int = 1
    private(set) var dataLoading: Bool = false
    
    init() {
        self.loadCharacters()
    }
    
    func loadCharacters() {
        self.dataLoading = true
        RickAndMortyAPI.charactersGet(page: page) { characters, error in
            guard let characters = characters else { return }
            DispatchQueue.main.async {
                self.characters.append(contentsOf: characters)
            }
            self.dataLoading = false
        }
    }
    
    func loadMoreCharacters() {
        self.page += 1
        self.loadCharacters()
    }
    
    func isCharacterLast(_ character: Character) -> Bool {
        guard
            let characterIndex = self.characters.firstIndex(where: { $0.id == character.id})
        else { return false }
        return characterIndex == self.characters.endIndex - 1
    }
}
