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

	func getAll() -> [RepositoryModel] {
		return getDaoAll()
	}

    func create(with object: ModelParameters) -> RepositoryModel {

        let product = new()
        product.name = object.name
        product.price = object.price
        product.quantityType = object.quantityType.rawValue
        product.quantity = object.quantity

        return product
    }

	func create(with dictionary: [String: Any]) -> RepositoryModel? {
		guard let name = dictionary["name"] as? String else { return nil }
		guard let priceString = dictionary["price"] as? String else { return nil }
		guard let quantityString = dictionary["quantity"] as? String else { return nil }
		guard let quantityTypeString = dictionary["quantityType"] as? String else { return nil }

		guard  let price = Double(priceString) else { return nil }
		guard  let quantity = Double(quantityString) else { return nil }
		guard let quantityType = QuantityType.init(rawValue: quantityTypeString) else { return nil }

		let product = create(with: (name: name, price: price, quantityType: quantityType, quantity: quantity))

		return product
	}

	func save(with object: Product) {
		createDao(object)
	}

    func update(with object: RepositoryModel) {
        updateDao(object)
    }

    func delete(with object: RepositoryModel) {
        deleteDao(object)
    }

}
