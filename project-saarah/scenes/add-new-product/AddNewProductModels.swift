//
//  AddNewProductModels.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 14/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum AddNewProduct {
	// MARK: Use cases
	enum LoadDefaultStatus {
		struct Request {
		}
		struct Response {
		}
		struct ViewModel {
			struct CellViewModel {
				let title: String
				let placeholder: String
				let acessoryType: Int
			}
			var cellViewModels: [CellViewModel]
		}
	}
}
