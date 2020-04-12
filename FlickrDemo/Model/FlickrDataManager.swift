//
//  FlickrDataManager.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/12.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation

class FlickrDataManager {
    
    static let shared = FlickrDataManager()
    
    private init() {}
    
    var flickrData: [PhotoDetail] = []
}
