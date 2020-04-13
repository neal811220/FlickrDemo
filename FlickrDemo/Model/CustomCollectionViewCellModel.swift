//
//  ContentCollectionViewCellModel.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import UIKit

class ContentCollectionViewCellModel: CustomCollectionViewCell {
        
    let identifier = CustomCollectionViewCell.identifier
    
    let flickrProvider = FlickrProvider()
    
    var passTapButton: ((UICollectionViewCell) -> Void)?
    
    func setCell(collectionViewCell: UICollectionViewCell, contentData: [PhotoDetail], indexPath: IndexPath) {
        
        guard let cell = collectionViewCell as? CustomCollectionViewCell else {
            
            return
        }
        
        cell.backgroundColor = UIColor.white
        
        cell.titleLabel.text = contentData[indexPath.row].title
        
        cell.tag = indexPath.row
        
        cell.passTapFavoriteButton = { [weak self] in
            
            self?.passTapButton?($0)
        }
                
        flickrProvider.imageURLTransformImage(photoURLString: contentData[indexPath.row].imageUrl) { (result) in
            
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

class FavoriteCollectionViewCellModel: CustomCollectionViewCell {
    
    let identifier = CustomCollectionViewCell.identifier

    var passTapButton: ((UICollectionViewCell) -> Void)?

    let flickrProvider = FlickrProvider()

    func setCell(collectionViewCell: UICollectionViewCell, contentData: [Favorites], indexPath: IndexPath) {

        guard let cell = collectionViewCell as? CustomCollectionViewCell else {

            return
        }

        cell.backgroundColor = UIColor.white

        cell.titleLabel.text = contentData[indexPath.row].title

        cell.tag = indexPath.row
        
        cell.favoriteButton.isHidden = true
        
        flickrProvider.imageURLTransformImage(photoURLString: contentData[indexPath.row].imageURL ?? "") { (result) in

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
