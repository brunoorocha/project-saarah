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

    func create(_ object: ModelParameters) -> Ingredient {
        let ingredient = new()
        ingredient.name = object.name
        ingredient.value = object.value
        ingredient.product = object.product

        create(ingredient)

        return ingredient
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
