//
//  FormManager.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 11/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

struct FormManager {
	let defaultFieldsCount: Int
	var fields: [FormData]
	
	init(formaName: String) {
		if let jsonPath = Bundle.main.path(forResource: formaName, ofType: "json") {
			do {
				let data = try Data(contentsOf: URL(fileURLWithPath: jsonPath), options: .mappedIfSafe)
				let json = try JSONDecoder().decode([FormData].self, from: data)
				
				defaultFieldsCount = json.count
				fields = json
			}
			catch let jsonError {
				print("Decoding error:", jsonError)
				fatalError("error decoding json form")
			}
		}
		else {
			fatalError("error decoding json form")
		}
	}
	
	mutating func addNewIngredientField() -> IndexPath {
		let formData = FormData(key: "ingredient", fieldName: "Ingrediente", placeholder: "Insira outro ingrediente", cellType: 1, inputType: 1)
		let beforeLastRow = fields.count - 1
		fields.insert(formData, at: beforeLastRow)
		
		return IndexPath(row: beforeLastRow, section: 0)
	}
	
	func product() -> Product? {
		var productDictionary: [String: Any] = [:]
		fields.forEach { (formaData) in
			productDictionary.merge(formaData.fieldValue) { (current, _) in current }
		}
		
		let productRepository = ProductRepository()
		let product = productRepository.create(with: productDictionary)
		
		return product
	}
	
	func dish() {
		fields.forEach { (formData) in
			print(formData.fieldValue)
		}
	}
}
