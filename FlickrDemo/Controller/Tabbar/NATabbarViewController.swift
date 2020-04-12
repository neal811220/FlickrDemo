//
//  NATabbarViewController.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/11.
//  Copyright © 2020 neal812220. All rights reserved.
//

import UIKit

private enum Tab {
    
    case search
    
    case favorite
    
    func controller() -> UIViewController {
        
        var controller: UIViewController
        
        switch self {
            
        case .search: controller = UINavigationController(rootViewController: SearchViewController())
        
        case .favorite: controller = UINavigationController(rootViewController: FavoriteViewController())
            
        }
        
        controller.tabBarItem = tabBarItem()
        
        return controller
    }
    
    func tabBarItem() -> UITabBarItem {
        
        switch self {
            
        case .search:
            
            return UITabBarItem(title: "Search", image: UIImage.asset(.Icons_32px_Search_Normal), selectedImage: UIImage.asset(.Icons_32px_Search_Selected))
            
        case .favorite:
            
            return UITabBarItem(title: "Favorite", image: UIImage.asset(.Icons_32px_favorite_Normal), selectedImage: UIImage.asset(.Icons_32px_favorite_selected))
            
        }
    }
}

class NATabbarViewController: UITabBarController {

    private let tabs: [Tab] = [.search, .favorite]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = tabs.map({ $0.controller() })
                
    }
}
