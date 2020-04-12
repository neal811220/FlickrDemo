//
//  FlickrObject.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/12.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

struct Datas: Codable {
    
    let photos: Photos
    
    let stat: String
}

struct Photos: Codable {
    
    let page: Int
    
    let pages: Int
    
    let perpage: Int
    
    let total: String
    
    let photo: [PhotoDetail]
}

struct PhotoDetail: Codable {
    
    let id: String
    
    let owner: String
    
    let secret: String
    
    let server: String
    
    let farm: Int
    
    let title: String
    
    let ispublic: Int
    
    let isfriend: Int
    
    let isfamily: Int
    
    var imageUrl: String {
        
        return "https://farm\(farm).staticflickr.com/\(server)/\(id)_\(secret)_m.jpg"
    }
}
