//
//  SelectProductMeasurementViewController.swift
//  project-saarah
//
//  Created by Thiago Valente on 16/10/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SelectProductMeasurementDisplayLogic: class {
    func displayFetchedMeasurements(viewModel: SelectProductMeasurement.FetchMeasurements.ViewModel)
}

class SelectProductMeasurementViewController: UIViewController, SelectProductMeasurementDisplayLogic {
    // MARK: Architeture Property
    var interactor: SelectProductMeasurementBusinessLogic?
    var router: (NSObjectProtocol & SelectProductMeasurementRoutingLogic & SelectProductMeasurementDataPassing)?

    // MARK: Controller Property
    private var contentView = SelectProductMeasurementView()
    var selectedIndexPath: IndexPath?

    // MARK: View lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        setup()
    }

    // MARK: Init
    init() {
        super.init(nibName: nil, bundle: nil)
        SelectProductMeasurementBuilder.build(aroundViewController: self)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private func setup() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(tappedSaveButton))
    }

    func setupContentView() {
        title = "\(Localization(.selectProductMeasurement(.title)))"
        view = contentView
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
    }

    // MARK: View lifecycle
    override func viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(animated)
      fetchMeasurements()
    }

    // MARK: Fetch Measurements

    var displayMeasurements: [SelectProductMeasurement.FetchMeasurements.ViewModel.DisplayMeasurement] = []

    func fetchMeasurements() {
        let request = SelectProductMeasurement.FetchMeasurements.Request()
        interactor?.fetchMeasurements(request: request)
    }

    func displayFetchedMeasurements(viewModel: SelectProductMeasurement.FetchMeasurements.ViewModel) {
        displayMeasurements = viewModel.displayMeasurements
        contentView.tableView.reloadData()
    }

    // MARK: Routes
    @objc
    func tappedSaveButton() {
        router?.routeToNewProduct()
    }
}

extension SelectProductMeasurementViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayMeasurements.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        contentView.buildCell(indexPath: indexPath, name: displayMeasurements[indexPath.row].name)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? SelectableCell else { return }
        if let selectedIndexPath = self.selectedIndexPath,
            let currentCell = tableView.cellForRow(at: selectedIndexPath) as? SelectableCell,
            currentCell != cell {
            currentCell.isChecked = false
        }
        cell.isChecked = true
        self.selectedIndexPath = indexPath
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return EmptySectionHeaderView()
    }

}
