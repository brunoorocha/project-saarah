//
//  UIViewController+PresentAlert.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 24/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIViewController {
	func presentAlertModal(_ title: String, _ message: String, _ actionTitle: String) {
		let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

		let action = UIAlertAction(title: actionTitle, style: .default, handler: nil)
		alert.addAction(action)

        action.setValue(AppStyleGuide.Colors.primary.uiColor, forKey: "titleTextColor")

		present(alert, animated: true, completion: nil)
	}
}
