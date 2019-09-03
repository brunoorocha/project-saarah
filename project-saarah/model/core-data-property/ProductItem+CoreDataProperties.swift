//
//  ProductItem+CoreDataProperties.swift
//  project-saarah
//
//  Created by Thiago Valente on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//
//

import Foundation
import CoreData

extension ProductItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductItem> {
        return NSFetchRequest<ProductItem>(entityName: "ProductItem")
    }

    @NSManaged public var name: String
    @NSManaged public var price: Double
    @NSManaged public var imagePath: String?
    @NSManaged public var product: Product

}

extension ProductItem {

    func information() -> String? {
        return nil
    }

    func averagePrice() -> Double {
        return product.price
    }

}
