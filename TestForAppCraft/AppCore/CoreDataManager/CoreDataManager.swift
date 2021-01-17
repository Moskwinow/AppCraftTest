//
//  CoreDataManager.swift
//  TestForAppCraft
//
//  Created by Максим Вечирко on 17.01.2021.
//

import CoreData

final class CoreDataManager {
    
    private init() {}
    static let shared = CoreDataManager()
  
    lazy var persistentContainer: NSPersistentContainer = {
      
        let container = NSPersistentContainer(name: "TestForAppCraft")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    lazy var context = persistentContainer.viewContext
    
    
    func save() {
        context.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        if context.hasChanges {
            do {
                try context.save()
              
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                
            }
        }
    }
    
    func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
        let entityName = String(describing: objectType)
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
        do {
            let fetchObjects = try context.fetch(fetchRequest) as? [T]
            return fetchObjects ?? [T]()
        } catch {
            print(error)
            return [T]()
        }
    }
}
