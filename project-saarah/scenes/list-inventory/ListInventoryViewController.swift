//
//  ListInventoryViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 04/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol ListInventoryDisplayLogic: class {
    func displayFetchedProducts(viewModel: ListInventory.FetchProducts.ViewModel)
}

class ListInventoryViewController: UIViewController, ListInventoryDisplayLogic {

    // MARK: Architeture Property
	var interactor: ListInventoryBusinessLogic?
	var router: (NSObjectProtocol & ListInventoryRoutingLogic & ListInventoryDataPassing)?

	// MARK: Controller Property
	private var contentView = ListInventoryView()

    var selectedRow: Int? {
        guard let indexPath = self.contentView.tableView.indexPathForSelectedRow else {
            return nil
        }
        return indexPath.row
    }

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
        setup()
	}

	// MARK: Init
	init() {
		super.init(nibName: nil, bundle: nil)
        ListInventoryBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

    private func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tappedAddButton))
    }

	func setupContentView() {
        title = "Estoque"
        view = contentView
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
	}

    // MARK: View lifecycle
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      fetchProducts()
    }

    // MARK: - Fetch products

    var displayProducts: [ListInventory.FetchProducts.ViewModel.DisplayProduct] = []

    func fetchProducts() {
        let request = ListInventory.FetchProducts.Request()
        interactor?.fetchProducts(request: request)
    }

	func displayFetchedProducts(viewModel: ListInventory.FetchProducts.ViewModel) {
        displayProducts = viewModel.displayProducts
        contentView.tableView.reloadData()
	}

    // MARK: Routes
    @objc
    func tappedAddButton() {

        let optionMenu = UIAlertController(title: nil, message: "Adicionar novo produto", preferredStyle: .actionSheet)

        let addWithBarcode = UIAlertAction(title: "Ler código de barras", style: .default)
		let add = UIAlertAction(title: "Adicionar sem código de barras", style: .default) { _ in
			let vc = AddNewProductViewController()
			self.present(vc, animated: true, completion: nil)
		}
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)

        optionMenu.addAction(addWithBarcode)
        optionMenu.addAction(add)
        optionMenu.addAction(cancelAction)

        self.present(optionMenu, animated: true, completion: nil)
    }

}

extension ListInventoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return contentView.buildHeaderSection(
            section: section,
            title: "Produtos no estoque"
        )
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayProducts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = displayProducts[indexPath.row]
        return contentView.buildCell(
            indexPath: indexPath,
            name: product.name,
            quantity: product.quantity
        )
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail()
    }
}
