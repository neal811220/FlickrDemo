//
//  File.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

enum ImageAsset: String {
    
    case Icons_32px_favorite_Normal
    
    case Icons_32px_favorite_selected
    
    case Icons_32px_Search_Normal
    
    case Icons_32px_Search_Selected
}

extension UIImage {
    
    static func asset(_ asset: ImageAsset) -> UIImage? {
        
        return UIImage(named: asset.rawValue)
    }
}
