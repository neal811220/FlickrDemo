//
//  ContentViewController.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {
    
    lazy var collectionView: UICollectionView = {
        
        let flowLayout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        flowLayout.scrollDirection = .vertical
        
        collectionView.registerContentCollectionViewCell(collectionView: collectionView)
        
        collectionView.backgroundColor = UIColor.white
        
        collectionView.dataSource = self

        collectionView.delegate = self
        
        return collectionView
    }()
    
    let flickrProvider = FlickrProvider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        setupCollectionView()
        
        fetchFlickrData()
    }
    
    let cells: [ContentCollectionViewCellDatasource] = [ContentCollectionViewCellModel()]
    
    let datas: [Any] = []
    
    func setupCollectionView() {
        
        view.addSubview(collectionView)
        
        collectionView.anchor(
            
            top: view.topAnchor,
            
            bottom: view.bottomAnchor,
            
            left: view.leftAnchor,
            
            right: view.rightAnchor
        )
    }
    
    func fetchFlickrData() {
        
        flickrProvider.fetchFlickrData(text: "apple", count: 10) { (result) in
            
            switch result {
                
            case .success:
                
                print("111")
                
            case .failure(let error):
                
                print(error)
            }
        }
    }
}

extension ContentViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cells[0].identifier, for: indexPath)
        
        cells[0].setCell(collectionViewCell: cell, contentData: datas)
        
        return cell
    }

}

extension ContentViewController: UICollectionViewDelegateFlowLayout {

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
