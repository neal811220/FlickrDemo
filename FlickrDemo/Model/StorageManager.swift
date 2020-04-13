//
//  FavoriteStorage.swift
//  FlickrDemo
//
//  Created by Neal on 2020/4/12.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class StorageManager {
    
    static let shared = StorageManager()
    
    private init() {}
    
    func insertFavoriteData(title: String, imageURL: String) {
        
        guard let favorites = NSEntityDescription.insertNewObject(
            forEntityName: "Favorites",
            into: self.persistentContainer.viewContext) as? Favorites else {
            
            return
        }
        
        favorites.title = title
        
        favorites.imageURL = imageURL
        
        saveContext()
    }
    
    func fetchCartData() -> [Favorites] {
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Favorites")
        
        do {
            
            if let results = try persistentContainer.viewContext.fetch(request) as? [Favorites] {
                
                return results
            }
            
            return []
            
        } catch {
            
            print(error.localizedDescription)
            
            return []
        }
    }
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Favorites")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func saveContext () {
        
        let context = persistentContainer.viewContext
        
        if context.hasChanges {
            
            do {
                
                try context.save()
                
            } catch {
                
                let nserror = error as NSError
                
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
