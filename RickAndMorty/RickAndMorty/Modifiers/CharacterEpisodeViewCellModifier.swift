//
//  CharacterEpisodeViewCellModifier.swift
//  RickAndMorty
//
//  Created by user on 25.06.2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import SwiftUI

struct CharacterEpisodeViewCellModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 60, height: 60)
            .background(Color.gray.opacity(0.2))
            .cornerRadius(15)
    }
}

extension View {
    func episodeViewCell() -> some View {
        self.modifier(CharacterEpisodeViewCellModifier())
    }
}
