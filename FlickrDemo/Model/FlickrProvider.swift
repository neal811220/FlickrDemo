//
//  FlickrProvider.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/12.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

class FlickrProvider {
    
    func fetchFlickrData(text: String, count: String, page: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        
        HTTPClient.shared.request(FlickrRequest.fetchPhotos(text: text, count: count, page: page)) { (result) in
            
            switch result {
                
            case .success(let data):
                
                do {
                     
                    let flickrData = try JSONDecoder().decode(Datas.self, from: data)
                    
                    FlickrDataManager.shared.flickrData.append(contentsOf: flickrData.photos.photo)
                    
                    completion(.success(()))
                    
                } catch {
                    
                    completion(.failure(error))
                    
                }
            
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
    
     func imageURLTransformImage(paging: Int, photoURLString: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
            
            guard let imageURL = URL(string: photoURLString) else {
                
                completion(.failure(NAHTTPClientError.URLError))
                return
            }
            
            let imageCache = NSCache<NSURL, UIImage>()
            
//            if PhotoDataManager.shared.photos.count - paging <= 50 && PhotoDataManager.shared.isFetchAll == false {
//
//                for index in PhotoDataManager.shared.currentPhotos.count ..< PhotoDataManager.shared.photos.count - 1 {
//
//                    PhotoDataManager.shared.currentPhotos.append(PhotoDataManager.shared.photos[index])
//
//                }
//
//                PhotoDataManager.shared.isFetchAll = true
//            }
//
//            if paging > PhotoDataManager.shared.currentPhotos.count - 10 && PhotoDataManager.shared.isFetchAll == false {
//
//                for index in PhotoDataManager.shared.currentPhotos.count ..< PhotoDataManager.shared.currentPhotos.count + 30 {
//
//                    PhotoDataManager.shared.currentPhotos.append(PhotoDataManager.shared.photos[index])
//
//                }
//            }
            
            if let image = imageCache.object(forKey: imageURL as NSURL) {
                
                completion(.success(image))
                
                return
            }
            
            URLSession.shared.delegateQueue.maxConcurrentOperationCount = 40
            
            URLSession.shared.dataTask(with: imageURL) { (data, response, error) in
                
                guard let data = data, error == nil else {
                    
                    return
                }
                
                guard let image = UIImage(data: data) else {
                    
                    return
                }
                
                imageCache.setObject(image, forKey: imageURL as NSURL)
                
                completion(.success(image))
                
            }.resume()
        }
}
