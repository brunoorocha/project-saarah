//
//  Reusable.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 07/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import Foundation

protocol Reusable: class {
	static var reuseIdentifier: String { get }
}

extension Reusable {
	static var reuseIdentifier: String {
		return String(describing: self)
	}
}
