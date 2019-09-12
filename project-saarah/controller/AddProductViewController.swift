//
//  AddProductViewController.swift
//  project-saarah
//
//  Created by Guilherme Colombini on 02/09/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol AddProductViewControllerDelegate: class {
	func productAdded()
}

class AddProductViewController: UIViewController, ConfigurableController {
	var contentView: UIView? = AddProductView()

	weak var delegate: AddProductViewControllerDelegate?

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        modalPresentationStyle = .formSheet
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

	override func viewDidLoad() {
		super.viewDidLoad()

		setupContentView()

		if let addProductView = contentView as? AddProductView {
			addProductView.delegate = self
		}
	}
}

extension AddProductViewController: AddProductViewDelegate {
	func dismiss() {
		dismiss(animated: true, completion: nil)
	}

	func added(_ product: Product) {
		let productRepository = ProductRepository()
		productRepository.save(with: product)

		delegate?.productAdded()
		dismiss(animated: true, completion: nil)
	}
}
