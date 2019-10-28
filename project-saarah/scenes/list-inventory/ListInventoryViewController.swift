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
    private var listInventoryTableViewDataSource = ListInventoryTableViewDataSource()

    private var isLoadingProducts = false {
        didSet {
            self.listInventoryTableViewDataSource.isShowingSkelectonCells = self.isLoadingProducts
            contentView.tableView.reloadData()
        }
    }

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
        fetchProducts()
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: AppStyleGuide.Icons.plus.uiImage, style: .plain, target: self, action: #selector(tappedAddButton))
    }

	func setupContentView() {
        title = Localization(.listInventoryScene(.title)).description
        view = contentView
        contentView.tableView.delegate = self
        listInventoryTableViewDataSource.registerCell(for: contentView.tableView)
        contentView.tableView.dataSource = listInventoryTableViewDataSource
	}

    // MARK: View lifecycle
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
    }

    // MARK: - Fetch products

    var displayProducts: [ListInventory.FetchProducts.ViewModel.DisplayProduct] = []

    func fetchProducts() {
        let request = ListInventory.FetchProducts.Request()
        interactor?.fetchProducts(request: request)
        isLoadingProducts = true
    }

	func displayFetchedProducts(viewModel: ListInventory.FetchProducts.ViewModel) {
        listInventoryTableViewDataSource.viewModels = viewModel.displayProducts
        isLoadingProducts = false
	}

    // MARK: Routes
    @objc
    func tappedAddButton(_ sender: AnyObject) {

        let optionMenu = UIAlertController(title: nil, message: "\(Localization(.listInventoryScene(.addAlertController(.title))))", preferredStyle: .actionSheet)
        // TODO: Add barcode reader
//        let addWithBarcode = UIAlertAction(title: "\(Localization(.listInventoryScene(.addAlertController(.addWithBarCode))))", style: .default)

        let addWithoutBarCode = UIAlertAction(title: "\(Localization(.listInventoryScene(.addAlertController(.addWithoutBarCode))))", style: .default) { _ in
			let vc = AddNewProductViewController()
			self.present(vc, animated: true, completion: nil)
		}

        addWithoutBarCode.setValue(AppStyleGuide.Colors.primary.uiColor, forKey: "titleTextColor")

        let cancelAction = UIAlertAction(title: "\(Localization(.listInventoryScene(.addAlertController(.cancel))))", style: .cancel)

        cancelAction.setValue(AppStyleGuide.Colors.primary.uiColor, forKey: "titleTextColor")

        if let popoverController = optionMenu.popoverPresentationController {
            popoverController.barButtonItem = sender as? UIBarButtonItem
        }

//        optionMenu.addAction(addWithBarcode)
        optionMenu.addAction(addWithoutBarCode)
        optionMenu.addAction(cancelAction)

        self.present(optionMenu, animated: true, completion: nil)
    }

}

extension ListInventoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return listInventoryTableViewDataSource.viewForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToDetail()
    }
}
