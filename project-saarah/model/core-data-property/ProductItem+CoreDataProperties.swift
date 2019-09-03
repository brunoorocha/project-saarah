//
//  ProductItem+CoreDataProperties.swift
//  project-saarah
//
//  Created by Thiago Valente on 03/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//
//

import Foundation
import CoreData

extension ProductItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductItem> {
        return NSFetchRequest<ProductItem>(entityName: "ProductItem")
    }

    @NSManaged public var imagePath: String?
    @NSManaged public var name: String
    @NSManaged public var price: Double
    @NSManaged public var product: Product

}
