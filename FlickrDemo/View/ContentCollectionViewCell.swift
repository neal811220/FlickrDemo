//
//  CollectionViewCell.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class ContentCollectionViewCell: UICollectionViewCell {
    
    let contentImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage.asset(.Icons_32px_favorite_selected)
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .center
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
        
        setupTitleLable()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupImageView() {
        
        self.addSubview(contentImageView)
        
        contentImageView.anchor(
            
            top: self.topAnchor,
            
            left: self.leftAnchor,
            
            right: self.rightAnchor,
            
            height: self.frame.height / 3 * 2
        )
    }
    
    func setupTitleLable() {
        
        self.addSubview(titleLabel)
        
        titleLabel.anchor(
            
            bottom: self.bottomAnchor,
            
            left: self.leftAnchor,
            
            right: self.rightAnchor,
            
            paddingBottom: 10
        )
    }
}
