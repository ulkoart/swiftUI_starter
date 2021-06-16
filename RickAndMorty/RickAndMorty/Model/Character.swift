//
//  Character.swift
//  RickAndMorty
//
//  Created by user on 08/06/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation

struct Character {
    let id: Int
    let name: String
    let status: String
    let species: String
    let image: String
}

extension Character: Codable {}
extension Character: Identifiable {}
