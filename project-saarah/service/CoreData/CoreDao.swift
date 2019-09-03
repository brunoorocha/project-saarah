//
//  CoreDao.swift
//  CoreDao
//
//  Created by Vinicius Mangueira on 01/07/19.
//  Copyright © 2019 Vinicius Mangueira. All rights reserved.
//

import CoreData

public class CoreDao<Element: NSManagedObject>: ConfigurableDao {

    public var context: NSManagedObjectContext

    init(with containerName: String) {
        let coreStack = CoreStack(with: containerName)
        context = coreStack.persistentContainer.viewContext
    }

    public func new() -> Element {
        guard let element =  NSEntityDescription.insertNewObject(forEntityName: Element.className, into: context) as? Element else {
            fatalError("Fail to save element")
        }
        return element
    }

    public func insert(object: Element) {
        context.insert(object)
        save()
    }

    public func fetchAll() -> [Element] {
        let request = NSFetchRequest<Element>(entityName: Element.className)
        do {
            return try context.fetch(request)
        } catch let error {
            print(error)
            return []
        }
    }

    public func delete(object: Element) {
        context.delete(object)
        save()
    }

    public func save() {
        do {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}
