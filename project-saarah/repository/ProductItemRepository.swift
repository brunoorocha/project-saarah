//
//  ProductItemRepository.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit
import CoreData

class ProductItemRepository: Repository {

    typealias RepositoryModel = ProductItem
    typealias ModelParameters = (name: String, price: Double, image: Data, product: Product)

    required init() {
        self.modelDao = CoreDao<RepositoryModel>(with: Environment.production.coreData)
    }

    var modelDao: CoreDao<ProductItem>

    func getAll() -> [RepositoryModel] {
        return getDaoAll()
    }

	func create(with object: ModelParameters) -> ProductItem {
		let productItem = new()
		productItem.name = object.name
		productItem.price = object.price

		guard let imageURL = DocumentsDirectory.saveFile(with: object.image, and: object.name) else {
			fatalError("Fail to save image")
		}

		productItem.imagePath = "\(imageURL)"
		productItem.product = object.product

		return productItem
	}

	func create(with dictionary: [String: Any]) -> ProductItem? {
		guard let name = dictionary["name"] as? String else { return nil }
		guard let priceString = dictionary["value"] as? String else { return nil }
		guard let price = Double(priceString) else { return nil }
		guard let image = dictionary["image"] as? Data else { return nil }
		guard let product = dictionary["product"] as? Product else { return nil }

		let productItem = create(with: (name: name, price: price, image: image, product: product))

		return productItem
	}

    func save(with object: RepositoryModel) {
        createDao(object)
    }

    func update(with object: RepositoryModel) {
        updateDao(object)
    }

    func delete(with object: RepositoryModel) {
        deleteDao(object)
    }

}
