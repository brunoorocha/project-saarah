//
//  AddProductItemModels.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum AddProductItem {
	struct AddItemForm {
		let quantity: Double
		let price: Double
		let expirationDate: String
	}
	// MARK: Use cases
	enum AddItem {
		struct Request {
			let addItemForm: AddItemForm
		}
		struct Response {
			let apiMessage: String
		}
		struct ViewModel {
			struct AddItemViewModel {
				let success: Bool
				let title: String
				let message: String
			}
		}
	}
}
