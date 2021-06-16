//
//  CharacterView.swift
//  RickAndMorty
//
//  Created by user on 09.06.2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import SwiftUI

struct CharacterEpisodeViewCell: View {
    var episodeNumberString: String
    
    init(episode: String) {
        let episodeArray = episode.split(separator: "/")

        if let episodeNumberString = episodeArray.last {
            
            self.episodeNumberString = String(episodeNumberString)
        } else {
            self.episodeNumberString = "?"
        }

        
    }
    
    var body: some View {
        VStack {
            Text(episodeNumberString)
                .font(.title)
        }
        .frame(width: 80, height: 80)
        .background(Color.gray.opacity(0.2))
        .cornerRadius(15)
    }
}

struct CharacterView: View {
    var character: Character
    
    init(character: Character) {
        self.character = character
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                
                // MARK: - main info
                
                RemoteImage(url: character.image)
                    .cornerRadius(15)
                Text("Основная информаиця")
                    .font(.title)
                    .padding(.bottom, 4)
                HStack {
                    Text("\(character.species) (\(character.gender)) - \(character.status)")
                        .font(.body)
                    Spacer()
                }
                .padding(.bottom, 4)
                
            }
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .frame(maxWidth: .infinity, alignment: .center)
            
            // MARK: - episode
            
            Text("Эпизоды")
                .font(.title)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(character.episode, id: \.self) { episode in
                        CharacterEpisodeViewCell(episode: episode)
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .center)
            }
            Spacer()
        }
        .navigationBarTitle("\(character.name)", displayMode: .large)
    }
}

//struct CharacterView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterView()
//    }
//}
