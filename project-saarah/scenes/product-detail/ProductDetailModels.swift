//
//  ProductDetailModels.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum ProductDetail {
	// MARK: Use cases
	enum GetProduct {
		struct Request {
		}
		struct Response {
			let product: Product
		}
		struct ViewModel {
			struct ProductViewModel {
				let name: String
				let quantity: String
			}
			struct LogViewModel {
				let date: String
				let message: String
				let activityIcon: ActivityIcon
			}

			var productViewModel: ProductViewModel
			var logsViewModels: [LogViewModel]
		}
	}
}
