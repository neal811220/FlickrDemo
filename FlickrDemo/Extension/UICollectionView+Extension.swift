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
    
    func registerCustomCollectionViewCell(collectionView: UICollectionView) {
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: CustomCollectionViewCell.identifier)
        
    }
    
}
