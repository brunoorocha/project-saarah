//
//  SettingsViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 05/11/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//

import UIKit

protocol SettingsDisplayLogic: class {
	func displayLogOutSuccessMessage(viewModel: Settings.Logout.ViewModel)
}

class SettingsViewController: SaarahViewController, SettingsDisplayLogic {
	// MARK: Architeture Property
	var interactor: SettingsBusinessLogic?
	var router: (NSObjectProtocol & SettingsRoutingLogic & SettingsDataPassing)?
    var settingsTableViewDataSource = SettingsTableViewDataSource()

	// MARK: Controller Property
	private var contentView = SettingsView()

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
		setupContentView()
	}

    // MARK: Init
    init() {
        super.init(nibName: nil, bundle: nil)
        SettingsBuilder.build(aroundViewController: self)
	}

	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}

	func setupContentView() {
		title = "\(Localization(.homeMenuOptionTitle(.settings)))"
		view = contentView
        settingsTableViewDataSource.registerCells(for: contentView.tableView)
        contentView.tableView.dataSource = settingsTableViewDataSource
        contentView.tableView.delegate = self
	}

    private func doLogOut() {
        let logOutRequest = Settings.Logout.Request()
        interactor?.doLogOut(request: logOutRequest)
    }

    func displayLogOutSuccessMessage(viewModel: Settings.Logout.ViewModel) {
        goToLoginScene()
        print("Log Out")
    }

    private func showConfirmationModalForLogout () {
        let confirmAction = UIAlertAction(title: "Log Out", style: .destructive) { [weak self] _ in
            self?.doLogOut()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)

        presentConfirmationModal(with: "Confirmation", message: "Do you really want to log out from application?", actions: [confirmAction, cancelAction])
    }

    private func goToLoginScene() {
        router?.routeToLoginScene()
    }
}

extension SettingsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return settingsTableViewDataSource.viewForHeader(in: section)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = settingsTableViewDataSource.tableViewSections[indexPath.section]
        switch section {
        case .logout:
            showConfirmationModalForLogout()
        }
    }
}
