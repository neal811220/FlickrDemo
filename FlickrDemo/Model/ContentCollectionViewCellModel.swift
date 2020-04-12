//
//  ContentCollectionViewCellModel.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

protocol ContentCollectionViewCellDatasource {
    
    var identifier: String { get }
    
    func setCell(collectionViewCell: UICollectionViewCell, contentData: Any)
}

class ContentCollectionViewCellModel: ContentCollectionViewCell, ContentCollectionViewCellDatasource {
    
    let identifier = ContentCollectionViewCell.identifier
    
    func setCell(collectionViewCell: UICollectionViewCell, contentData: Any) {
        
        guard let cell = collectionViewCell as? ContentCollectionViewCell else {
            
            return
        }
        cell.backgroundColor = UIColor.white
        cell.titleLabel.text = "55555555"
    }
    
    
}
