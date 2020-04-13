//
//  FavoriteViewController.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class FavoriteViewController: UIViewController {

    lazy var collectionView: UICollectionView = {

        let flowLayout = UICollectionViewFlowLayout()

        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)

        flowLayout.scrollDirection = .vertical

        collectionView.registerCustomCollectionViewCell(collectionView: collectionView)

        collectionView.backgroundColor = UIColor.white

        collectionView.dataSource = self

        collectionView.delegate = self

        return collectionView
    }()
    
    let flickrProvider = FlickrProvider()
    
    var cellModel = FavoriteCollectionViewCellModel()
    
    var datas: [Favorites] = []
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        navigationItem.title = "我的最愛"
        
        NotificationCenter.default.addObserver(self, selector: #selector(addFavorite), name: Notification.Name("addFavorite"), object: nil)
        
        setupCollectionView()
        
        addFavorite()
    }
    
    func setupCollectionView() {
        
        view.addSubview(collectionView)
        
        collectionView.anchor(
            
            top: view.topAnchor,
            
            bottom: view.bottomAnchor,
            
            left: view.leftAnchor,
            
            right: view.rightAnchor
        )
    }
    
    @objc func addFavorite() {
        
        datas = StorageManager.shared.fetchCartData()
        
        collectionView.reloadData()
    }
    
}

extension FavoriteViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return datas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellModel.identifier, for: indexPath)
        
        cellModel.setCell(collectionViewCell: cell, contentData: datas, indexPath: indexPath)
        
        return cell
    }

}

extension FavoriteViewController: UICollectionViewDelegateFlowLayout {

   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    return CGSize(width: view.frame.width / 2 - 15, height: view.frame.width / 2 - 15)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
}

