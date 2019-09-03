//
//  CoreDataService.swift
//  project-saarah
//
//  Created by Thiago Valente on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import CoreData

class CoreDataService: NSObject {

    static var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "project_saarah")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    static func fetch<T>(_ request: NSFetchRequest<T>) -> [T] {
        do {
            let list = try persistentContainer.viewContext.fetch(request)
            return list
        } catch {
            print(error)
            return [T]()
        }
    }

    static func remove(object obj: NSManagedObject) {
        persistentContainer.viewContext.delete(obj)
    }

    static func saveContext () throws {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                throw error as NSError
            }
        }
    }
}
