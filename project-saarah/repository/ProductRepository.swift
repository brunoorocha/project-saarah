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

    typealias ModelParameters = (name: String,
                                 price: Double,
                                 quantityType: QuantityType,
                                 quantity: Double)
    typealias RepositoryModel = Product

    var modelDao: CoreDao<RepositoryModel>

    required init() {
        self.modelDao = CoreDao<RepositoryModel>(with: Environment.production.coreData)
    }

    func create(_ object: ModelParameters) -> RepositoryModel {

        let product = new()
        product.name = object.name
        product.price = object.price
        product.quantityType = object.quantityType.rawValue
        product.quantity = object.quantity

        create(product)

        return product
    }

    func getAll() -> [RepositoryModel] {
        return getDaoAll()
    }

    func create(_ object: RepositoryModel) {
        createDao(object)
    }

    func update(_ object: RepositoryModel) {
        updateDao(object)
    }

    func delete(_ object: RepositoryModel) {
        deleteDao(object)
    }

}
