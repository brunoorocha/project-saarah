//
//  UITableView+Reusable.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 07/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UITableView {
	func register<T: UITableViewCell>(cellType: T.Type) where T: Reusable {
		self.register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
	}
	
	func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T where T: Reusable {
		guard let cell = self.dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
			fatalError(
				"Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
					+ "Check that the reuseIdentifier is set properly in your XIB/Storyboard "
					+ "and that you registered the cell beforehand"
			)
		}
		return cell
	}
}
