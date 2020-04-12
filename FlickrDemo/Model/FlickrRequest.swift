//
//  NARequest.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

enum FlickrRequest: NARequest {
    
    case fetchPhotos(text: String, count: Int)
    
    var headers: [String : String] {
        
        switch self {
            
        case .fetchPhotos:
            
            return [
                NAHTTPHeaderField.contentType.rawValue : NAHTTPHeaderValue.json.rawValue
            ]
        }
    }
    
    var body: Data? {
        
        switch self {
            
        case .fetchPhotos:
            
            return nil

        }
    }
    
    var method: String {
        
        switch self {
            
        case .fetchPhotos:
            
            return NAHTTPMethod.GET.rawValue

        }
    }
    
    var endPoint: String {
        
        switch self {
            
        case .fetchPhotos(let text, let count):
            
            return "&text=\(text)&per_page=\(count)&format=json&nojsoncallback=1"
            
        }
    }
    
}
