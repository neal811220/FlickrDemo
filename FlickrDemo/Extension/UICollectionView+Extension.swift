//
//  UICollectionView+Extension.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
    
    func registerContentCollectionViewCell(collectionView: UICollectionView) {
        
        collectionView.register(ContentCollectionViewCell.self, forCellWithReuseIdentifier: ContentCollectionViewCell.identifier)
    }
}
