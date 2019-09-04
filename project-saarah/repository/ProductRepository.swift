//
//  ProductRepository.swift
//  project-saarah
//
//  Created by Thiago Valente on 03/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation
import CoreData

class ProductRepository: Repository {

    typealias RepositoryModel = Product
    let modelDao = CoreDao<RepositoryModel>()

    func getAll() -> [RepositoryModel] {
        return modelDao.fetchAll()
    }

    func create(_ object: RepositoryModel) {
        modelDao.insert(object: object)
    }

    func update(_ object: RepositoryModel) {
        modelDao.save()
    }

    func delete(_ object: RepositoryModel) {
        modelDao.delete(object: object)
    }

    func create(_ name: String,
                _ price: Double,
                _ quantityType: QuantityType,
                _ quantity: Double)
                -> RepositoryModel {

        let product = new()
        product.name = name
        product.price = price
        product.quantityType = quantityType.rawValue
        product.quantity = quantity

        create(product)

        return product
    }

}
