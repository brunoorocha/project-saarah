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
	enum Something {
		struct Request {
		}
		struct Response {
		}
		struct ViewModel {
			struct SomeViewModel {
			}
			var someViewModels: [SomeViewModel]
		}
	}
}
