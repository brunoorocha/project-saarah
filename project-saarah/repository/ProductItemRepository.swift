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

    func create(_ object: ModelParameters) -> ProductItem {
        let productItem = new()
        productItem.name = object.name
        productItem.price = object.price

        guard let imageURL = DocumentsDirectory.saveFile(with: object.image, and: object.name) else {
            fatalError("Fail to save image")
        }

        productItem.imagePath = "\(imageURL)"
        productItem.product = object.product

        create(productItem)

        return productItem
    }

    var modelDao: CoreDao<ProductItem>

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
