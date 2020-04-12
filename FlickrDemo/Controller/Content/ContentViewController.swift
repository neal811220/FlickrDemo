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
        
        collectionView.registerCustomCollectionViewCell(collectionView: collectionView)
        
        collectionView.backgroundColor = UIColor.white
        
        collectionView.dataSource = self

        collectionView.delegate = self
        
        return collectionView
    }()
    
    let flickrProvider = FlickrProvider()
    
    var inputText = ""
    
    var searchCount = ""
        
    var datas: [PhotoDetail] = [] {
        
        didSet {
            
            DispatchQueue.main.async {
                
                self.collectionView.reloadData()
            }
        }
    }
    
    var page = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
        
        navigationItem.title = "搜尋結果"
        
        setupCollectionView()
        
        fetchFlickrData()
    }
    
    let cells: [CustomCollectionViewCellDatasource] = [ContentCollectionViewCellModel()]
        
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
        print("FetchPage==>>\(page)")
        flickrProvider.fetchFlickrData(text: inputText, count: searchCount, page: page) { [weak self] (result) in
            
            guard let strongSelf = self else {
                
                return
            }
            
            switch result {
                
            case .success:
                
                strongSelf.datas = FlickrDataManager.shared.flickrData
                
                print(strongSelf.datas.count)
            case .failure(let error):
                
                print(error)
            }
        }
    }
}

extension ContentViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return datas.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
                
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cells[0].identifier, for: indexPath)

        cells[0].setCell(collectionViewCell: cell, contentData: datas, indexPath: indexPath)
        
        return cell
    }

}

extension ContentViewController: UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        print("indexpath==>\(indexPath.row)")
//        print("datas==>\(datas.count - 1)")
//        print(page)
        if indexPath.row == datas.count - 1 {

            page += 1

            fetchFlickrData()
        }
        
    }
}

extension ContentViewController: UICollectionViewDelegateFlowLayout {

   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
    return CGSize(width: view.frame.width / 2 - 15, height: view.frame.width / 2 - 15)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets(top: 10, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 10
    }
}
