//
//  ProductItem+CoreDataClass.swift
//  project-saarah
//
//  Created by Thiago Valente on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//
//

import Foundation
import CoreData

@objc(ProductItem)
public class ProductItem: NSManagedObject, Item {

    public func information() -> String? {
        return nil
    }

    public func averagePrice() -> Double {
        return product.price
    }

}
