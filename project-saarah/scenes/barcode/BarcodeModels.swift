//
//  BarcodeModels.swift
//  project-saarah
//
//  Created by Thiago Valente on 13/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import Foundation

enum Barcode {
	// MARK: Use cases
	enum ProductReader {
		struct Request {
            var barcode: String
		}
		struct Response {
            var product: Product?
		}
		struct ViewModel {
            var hasProduct: Bool
		}
	}
}
