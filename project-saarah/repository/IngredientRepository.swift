//
//  IngredientRepository.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation
import CoreData

class IngredientRepository: Repository {

    typealias RepositoryModel = Ingredient
    typealias ModelParameters = (name: String, value: Double, product: Product)

    var modelDao: CoreDao<Ingredient>

    required init() {
        self.modelDao = CoreDao<RepositoryModel>(with: Environment.production.coreData)
    }

	func getAll() -> [RepositoryModel] {
		return getDaoAll()
	}

    func create(with object: ModelParameters) -> Ingredient {
        let ingredient = new()
        ingredient.name = object.name
        ingredient.value = object.value
        ingredient.product = object.product

        return ingredient
    }

	func create(with dictionary: [String: Any]) -> Ingredient? {
		guard let name = dictionary["name"] as? String else { return nil }
		guard let valueString = dictionary["value"] as? String else { return nil }
		guard let value = Double(valueString) else { return nil }
		guard let product = dictionary["product"] as? Product else { return nil }

		let ingredient = create(with: (name: name, value: value, product: product))

		return ingredient
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
