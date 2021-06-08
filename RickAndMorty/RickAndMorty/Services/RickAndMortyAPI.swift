//
//  RickAndMortyAPI.swift
//  RickAndMorty
//
//  Created by user on 08/06/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation


struct ApiResponse: Codable {
    let info: Info
    let results: [Character]
}

struct Info: Codable {
    let count, pages: Int
    let next: String
}


final class RickAndMortyAPI {
    
    enum Endpoint {
        static let baseUrl: String = "https://rickandmortyapi.com/api/"
        case characters
        
        var url: URL {
            return URL(string: self.stringValue)!
        }
        
        var stringValue: String {
            switch self {
                
            case .characters:
                return Endpoint.self.baseUrl + "character"
                
            }
        }
    }
    
    class func charactersGet(completionHandler: @escaping ([Character]?, Error?) -> Void) {
        print(#function)
        
        let charactersEndpoint = RickAndMortyAPI.Endpoint.characters.url
        
        let task = URLSession.shared.dataTask(with: charactersEndpoint) {data, response, error in
            guard let data = data else { return }
            
            let decoder = JSONDecoder()
            let apiResponse = try! decoder.decode(ApiResponse.self, from: data)
            let characters: [Character] = apiResponse.results
            completionHandler(characters, nil)
        }
        task.resume()
        
        
    }
}
