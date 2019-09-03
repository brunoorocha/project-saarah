//
//  Quantity+CoreDataProperties.swift
//  project-saarah
//
//  Created by Thiago Valente on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//
//

import Foundation
import CoreData

extension Quantity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Quantity> {
        return NSFetchRequest<Quantity>(entityName: "Quantity")
    }

    @NSManaged public var type: NSObject
    @NSManaged public var value: Double
    @NSManaged public var product: Product?

}
