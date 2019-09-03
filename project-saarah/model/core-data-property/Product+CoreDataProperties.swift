//
//  Product+CoreDataProperties.swift
//  project-saarah
//
//  Created by Thiago Valente on 03/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//
//

import Foundation
import CoreData

extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var name: String?
    @NSManaged public var price: Double
    @NSManaged public var quantity: Double
    @NSManaged public var quantityType: String
    @NSManaged public var ingrendients: NSSet?
    @NSManaged public var productItem: NSSet?

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

// MARK: Generated accessors for productItem
extension Product {

    @objc(addProductItemObject:)
    @NSManaged public func addToProductItem(_ value: ProductItem)

    @objc(removeProductItemObject:)
    @NSManaged public func removeFromProductItem(_ value: ProductItem)

    @objc(addProductItem:)
    @NSManaged public func addToProductItem(_ values: NSSet)

    @objc(removeProductItem:)
    @NSManaged public func removeFromProductItem(_ values: NSSet)

}
