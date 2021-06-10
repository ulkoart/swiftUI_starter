//
//  Character.swift
//  RickAndMorty
//
//  Created by user on 08/06/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation

struct Character: Codable, Identifiable, Equatable {
    let id: Int
    let name: String
    let image: String
}
