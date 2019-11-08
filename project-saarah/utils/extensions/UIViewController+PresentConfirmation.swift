//
//  UIViewController+PresentConfirmation.swift
//  project-saarah
//
//  Created by Bruno Rocha on 06/11/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

extension UIViewController {
    func presentConfirmationModal(with title: String, message: String, actions: [UIAlertAction]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        actions.forEach { alertController.addAction($0) }
        present(alertController, animated: true)
    }
}
