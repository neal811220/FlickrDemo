//
//  FlickrProvider.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/12.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

class FlickrProvider {
    
    func fetchFlickrData(text: String, count: Int, completion: @escaping (Result<Void, Error>) -> Void) {
        
        HTTPClient.shared.request(FlickrRequest.fetchPhotos(text: text, count: count)) { (result) in
            
            switch result {
                
            case .success(let data):
                
                do {
                    
                    let flickrData = try JSONDecoder().decode(Datas.self, from: data)
                    
                    FlickrDataManager.shared.flickrData = flickrData
                    
                    completion(.success(()))
                    
                } catch {
                    
                    completion(.failure(error))
                    
                }
            
            case .failure(let error):
                
                completion(.failure(error))
            }
        }
    }
}
