//
//  Product+CoreDataProperties.swift
//  project-saarah
//
//  Created by Thiago Valente on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//
//

import Foundation
import CoreData

extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String
    @NSManaged public var price: Double
    @NSManaged public var quantity: Quantity
    @NSManaged public var ingrendients: NSSet?
    @NSManaged public var productItem: ProductItem?

}

// MARK: Generated accessors for ingrendients
extension Product {

    @objc(addIngrendientsObject:)
    @NSManaged public func addToIngrendients(_ value: Ingredient)

    @objc(removeIngrendientsObject:)
    @NSManaged public func removeFromIngrendients(_ value: Ingredient)

    @objc(addIngrendients:)
    @NSManaged public func addToIngrendients(_ values: NSSet)

    @objc(removeIngrendients:)
    @NSManaged public func removeFromIngrendients(_ values: NSSet)

}
