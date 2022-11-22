//
//  CoreDataManager.swift
//  ToNotey
//
//  Created by Andrei Tanc on 22.11.2022.
//

import Foundation
import CoreData

protocol NoteyDataProtocol {
    func initWithData(_ data: [String: Any])
}

class CoreDataManager {
    static let shared = CoreDataManager()
    private let kContainerName = "NoteyData"
    private init() {}
    
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: kContainerName)
        
        container.loadPersistentStores(completionHandler: { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        
        return container
    }()
    
    func fetchAll<NoteyItem>(ofType type: NoteyItem.Type) -> [NoteyItem] where NoteyItem: NSManagedObject {
        do {
            let noteyItems = try persistentContainer.viewContext.fetch(NoteyItem.fetchRequest())
            return noteyItems as? [NoteyItem] ?? []
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
            return []
        }
    }
    
    func insertItem<NoteyItem>(ofType type: NoteyItem.Type, withData data: [String: Any]) where NoteyItem: NSManagedObject & NoteyDataProtocol {
        let noteyItem = NoteyItem(context: persistentContainer.viewContext)
        noteyItem.initWithData(data)
        
        saveContext()
    }
    
    func delete<NoteyItem>(_ item : NoteyItem, ofType type: NoteyItem.Type) where NoteyItem: NSManagedObject {
        persistentContainer.viewContext.delete(item)
        saveContext()
    }
    
    func saveContext () {
        if persistentContainer.viewContext.hasChanges {
            do {
                try persistentContainer.viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
