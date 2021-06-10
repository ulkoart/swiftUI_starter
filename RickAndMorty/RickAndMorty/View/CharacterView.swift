//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by user on 09.06.2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import SwiftUI

struct CharacterView: View {
    var character: Character
    
    var body: some View {
        ScrollView {
            VStack {
                RemoteImage(url: character.image)
                    .cornerRadius(15)
            }
            .frame(maxWidth: .infinity, alignment: .center)
//            .padding(16)
//            .background(Color.gray.opacity(0.2))
//            .cornerRadius(15)
            Spacer()
        }
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .navigationBarTitle("\(character.name)")
    }
}

//struct CharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterView()
//    }
//}
