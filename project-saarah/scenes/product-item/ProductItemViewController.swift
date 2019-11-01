//
//  ProductItemViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 17/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ProductItemDisplayLogic: class {
    func displayProduct(viewModel: ProductItem.ReceiveProduct.ViewModel)
	func displayProductItem(viewModel: ProductItem.FetchProductItem.ViewModel)
	func displayInsertedProductItem(viewModel: ProductItem.InsertProductItem.ViewModel)
}

class ProductItemViewController: UIViewController, ProductItemDisplayLogic {
	// MARK: Architeture Property
	var interactor: ProductItemBusinessLogic?
	var router: (NSObjectProtocol & ProductItemRoutingLogic & ProductItemDataPassing)?

	// MARK: Controller Property
	private var contentView = ProductItemView()
    let tableViewDataSource = ProductItemTableViewDataSource()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
        configureViewController()
		setupContentView()
        getProduct()
        fetchProductItems()
	}

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
        ProductItemBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

    func configureViewController () {
        title = "\(Localization(.productItemScene(.title)))"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: AppStyleGuide.Icons.plus.uiImage, style: .plain, target: self, action: #selector(didTapOnAddNavigationBarButton))
    }

    func setupContentView() {
        view = contentView
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        tableViewDataSource.registerCells(for: contentView.tableView)
	}

    @objc func didTapOnAddNavigationBarButton () {
        router?.routeToAddProductItem()
    }

    // MARK: Get product
    func getProduct() {
        let request = ProductItem.ReceiveProduct.Request()
        interactor?.getProduct(request: request)
    }

    // MARK: Fetch product items
    func fetchProductItems() {
        let request = ProductItem.FetchProductItem.Request()
        interactor?.fetchProductItem(request: request)
    }

    // MARK: Display product
    func displayProduct(viewModel: ProductItem.ReceiveProduct.ViewModel) {
        tableViewDataSource.productViewModel = viewModel
        contentView.tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }

    // MARK: Display Product Item
    func displayProductItem(viewModel: ProductItem.FetchProductItem.ViewModel) {
        tableViewDataSource.viewModel = viewModel
        contentView.tableView.reloadData()
	}

	// MARK: Display inserted product item
	func displayInsertedProductItem(viewModel: ProductItem.InsertProductItem.ViewModel) {
		tableViewDataSource.viewModel?.displayProductItems.append(viewModel.displayProductItem)
		guard let row = tableViewDataSource.viewModel?.displayProductItems.count else { return }
		let indexPath = IndexPath(row: (row - 1), section: 1)
		contentView.tableView.beginUpdates()
		contentView.tableView.insertRows(at: [indexPath], with: .automatic)
		contentView.tableView.endUpdates()
		contentView.tableView.scrollToRow(at: indexPath, at: .bottom, animated: true)
	}
}

extension ProductItemViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewDataSource.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDataSource.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let reuseIdentifier = tableViewDataSource.reuseIdentifier(for: indexPath.section)
        let reusableCell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath)
        let cell = tableViewDataSource.modify(reusableCell, for: indexPath)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if (section == 2) { return AppStyleGuide.Margins.medium.rawValue }
        return 0.01
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if (section == 2) { return AppStyleGuide.Margins.medium.rawValue }
        return 0.01
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.zero)
    }

    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView.init(frame: CGRect.zero)
    }
}
