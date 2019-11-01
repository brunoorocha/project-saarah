//
//  ListInventoryModels.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum ListInventory {
	// MARK: Use cases
	enum FetchProducts {
		struct Request {
		}
		struct Response {
            var products: [Product]
		}
		struct ViewModel {
			struct DisplayProduct {
                var name: String
                var quantity: String
			}
			var displayProducts: [DisplayProduct]
		}
	}
	
	enum InsertProduct {
 		struct Request {
 		}
 		struct Response {
 			let product: Product
 		}
 		struct ViewModel {
 			let displayProduct: ListInventory.FetchProducts.ViewModel.DisplayProduct
 		}
 	}
}
