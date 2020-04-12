//
//  CollectionViewCell.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    let contentImageView: UIImageView = {
        
        let imageView = UIImageView()
        
        imageView.image = UIImage.asset(.Icons_32px_Loading)
        
        return imageView
    }()
    
    let titleLabel: UILabel = {
        
        let label = UILabel()
        
        label.textAlignment = .center
        
        return label
    }()
    
    let favoriteButton: UIButton = {
        
        let button = UIButton()
        
        button.backgroundColor = UIColor.blue
        
        button.setTitle("收藏", for: .normal)
        
        button.setTitleColor(UIColor.white, for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupImageView()
        
        setupTitleLable()
        
        setupFavoriteButton()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        self.contentImageView.image = nil
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
            
            top: contentImageView.bottomAnchor,
                        
            left: self.leftAnchor,
            
            right: self.rightAnchor
                        
        )
    }
    
    func setupFavoriteButton() {
        
        self.addSubview(favoriteButton)
        
        favoriteButton.anchor(
            
            top: titleLabel.bottomAnchor,
            
            left: self.leftAnchor,
            
            right: self.rightAnchor,
            
            height: 30
        )
        
//        favoriteButton.layer.cornerRadius = 10
    }
}
