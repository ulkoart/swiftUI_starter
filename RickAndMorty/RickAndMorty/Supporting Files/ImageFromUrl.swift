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

class ImageCacheProvider {
    private var imageCache = NSCache<NSString, UIImage>()
    
    static var shared: ImageCacheProvider = {
        let instance = ImageCacheProvider()
        return instance
    }()
    
    private init() {}
    
    func getCashedImage(url: String) -> UIImage? {
        return imageCache.object(forKey: url as NSString)
    }
    
    func setCashedImage(image: UIImage, url: String) -> Void {
        self.imageCache.setObject(image, forKey: url as NSString)
    }
}

class ImageLoader: ObservableObject {
    @Published var downloadImage: UIImage?
    let imageCacheProvider: ImageCacheProvider = ImageCacheProvider.shared
    
    func fetchImage(url: String) {
        
        if let cashedImage = imageCacheProvider.getCashedImage(url: url) {
            self.setDownloadImage(cashedImage)
        } else {
            self.dataTaskImage(url: url)
        }
    }
    
    private func dataTaskImage(url: String) {
        guard let imageURL = URL(string: url) else { return }
        URLSession.shared.dataTask(with: imageURL) { [weak self] data, response, error in
            guard
                let data = data, error == nil,
                let image = UIImage(data: data),
                let `self` = self
            else { return }
            
            self.imageCacheProvider.setCashedImage(image: image, url: url)
            self.setDownloadImage(image)
        }.resume()
    }
    
    private func setDownloadImage(_ image: UIImage) {
        DispatchQueue.main.async {
            self.downloadImage = image
        }
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
