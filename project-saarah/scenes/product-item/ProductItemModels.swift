//
//  ProductItemModels.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum ProductItem {
	// MARK: Use cases
    enum ReceiveProduct {
        struct Request {
        }
        struct Response {
            let product: Product
        }
        struct ViewModel {
            struct Product {
                var name: String
            }
            var product: Product
        }
    }
	enum FetchProductItem {
		struct Request {
		}
		struct Response {
            let ProductItems: [ProductLog]
		}
		struct ViewModel {
			struct DisplayProductItem {
                var amount: String
                var expiration: String
                var price: String
                var created: String
			}
			var displayProductItems: [DisplayProductItem]
		}
	}
	enum InsertProductItem {
		struct Request {
			let productItem: ProductLog
		}
		struct Response {
			let productItem: ProductLog
		}
		struct ViewModel {
			let displayProductItem: ProductItem.FetchProductItem.ViewModel.DisplayProductItem
		}
	}
}
