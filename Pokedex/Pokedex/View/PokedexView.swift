//
//  PokedexView.swift
//  Pokedex
//
//  Created by user on 10/06/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import SwiftUI

struct PokedexView: View {
    var body: some View {
        NavigationView {
            List {
                PokemonCell()
                PokemonCell()
            }
            .navigationBarTitle("Pokemon")
        }
    }
}


struct PokedexView_Previews: PreviewProvider {
    static var previews: some View {
        PokedexView()
    }
}
