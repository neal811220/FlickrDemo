//
//  ContentCollectionViewCellModel.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

protocol CustomCollectionViewCellDatasource {
    
    var identifier: String { get }
    
    func setCell(collectionViewCell: UICollectionViewCell, contentData: [PhotoDetail], indexPath: IndexPath)
}

class ContentCollectionViewCellModel: CustomCollectionViewCell, CustomCollectionViewCellDatasource {
    
    let identifier = CustomCollectionViewCell.identifier
    
    let flickrProvider = FlickrProvider()
    
    func setCell(collectionViewCell: UICollectionViewCell, contentData: [PhotoDetail], indexPath: IndexPath) {
        
        guard let cell = collectionViewCell as? CustomCollectionViewCell else {
            
            return
        }
        
        cell.backgroundColor = UIColor.white
        
        cell.titleLabel.text = contentData[indexPath.row].title
        
        cell.tag = indexPath.row
        
        flickrProvider.imageURLTransformImage(paging: 30, photoURLString: contentData[indexPath.row].imageUrl) { (result) in
            
            switch result {
                
            case .success(let image):
                
                DispatchQueue.main.async {
                    
                    if cell.tag == indexPath.row {
                        
                        cell.contentImageView.image = image
                    }
                }
                
            case .failure(let error):
                
                print(error)
            }
        }
    }
}

class FavoriteCollectionViewCellModel: CustomCollectionViewCell, CustomCollectionViewCellDatasource {
    
    let identifier = CustomCollectionViewCell.identifier
    
    func setCell(collectionViewCell: UICollectionViewCell, contentData: [PhotoDetail], indexPath: IndexPath) {
        
        guard let cell = collectionViewCell as? CustomCollectionViewCell else {
            
            return
        }
        
        cell.backgroundColor = UIColor.white
        cell.titleLabel.text = "55555555"
    }
}
