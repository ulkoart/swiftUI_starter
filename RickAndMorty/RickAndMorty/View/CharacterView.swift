//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by user on 09.06.2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import SwiftUI

struct CharacterView: View {
    var characterId: Int
    
    var body: some View {
        Text("id: \(characterId)")
    }
}

struct CharacterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterView(characterId: 1)
    }
}
