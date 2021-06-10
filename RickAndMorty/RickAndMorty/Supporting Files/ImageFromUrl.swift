//
//  ImageFromUrl.swift
//  RickAndMorty
//
//  Created by user on 10/06/2021.
//  Copyright © 2021 Artem Ulko. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var downloadImage: UIImage?
    
    func fetchImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
        
        URLSession.shared.dataTask(with: imageURL) {data, response, error in
            guard
                let data = data, error == nil
            else { return }
            
            DispatchQueue.main.async {
                self.downloadImage = UIImage(data: data)
            }
            
        }.resume()
        
    }
}

struct RemoteImage: View {
    
    @ObservedObject var imageLoader: ImageLoader = ImageLoader()
    var placeholder = Image(systemName: "photo")
    
    init(url: String) {
        imageLoader.fetchImage(url: url)
    }
    
    var body: some View {
        if let image = self.imageLoader.downloadImage {
            return Image(uiImage: image)
        }
        return placeholder
    }
}
