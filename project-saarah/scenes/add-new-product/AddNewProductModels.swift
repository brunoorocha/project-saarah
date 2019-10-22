//
//  AddNewProductModels.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum AddNewProduct {
	struct ProductForm {
		let name: String
		let barCode: String?
		let measure: String
	}
	// MARK: Use cases
	enum SaveProduct {
		struct Request {
			let productForm: ProductForm
		}
		struct Response {
			let success: Bool
		}
		struct ViewModel {
			struct Response {
				var success: Bool
				var title: String
				var message: String
            }
        }
	}
}
