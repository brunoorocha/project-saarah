//
//  HomeViewController.swift
//  project-saarah
//
//  Created by Bruno Rocha on 29/09/19.
//  Copyright (c) 2019 Bruno Rocha. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

struct SaarahTableViewSection {
    var headerView: UIView
    var cells: [UITableViewCell]
}

protocol HomeDisplayLogic: class {
    func displayHomeNotifications (viewModel: Home.FetchHomeNotifications.ViewModel)
}

class HomeViewController: SaarahViewController, HomeDisplayLogic {
	// MARK: Property
	var interactor: HomeBusinessLogic?
	var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?

    private var homeView = HomeView()
    private var homeMenuOptions = HomeMenuOption.allCases
    private var displayedHomeNotifications = [Home.FetchHomeNotifications.ViewModel.DisplayedHomeNotification]()
    private var tableViewSections = [SaarahTableViewSection]()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
        defaultViewControllerConfiguration()
		requestHomeNotifications()
	}

	// MARK: Setup
	private func setup() {
		let viewController = self
		let interactor = HomeInteractor()
		let presenter = HomePresenter()
		let router = HomeRouter()
		viewController.interactor = interactor
		viewController.router = router
		interactor.presenter = presenter
		presenter.viewController = viewController
		router.viewController = viewController
		router.dataStore = interactor
	}

    func defaultViewControllerConfiguration () {
        title = "Restaurante"
        view = homeView
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        setHomeMenuTableViewSection()
    }

    func requestHomeNotifications () {
        let request = Home.FetchHomeNotifications.Request()
        interactor?.fetchHomeNotifications(request: request)
    }

    func displayHomeNotifications (viewModel: Home.FetchHomeNotifications.ViewModel) {
        displayedHomeNotifications = viewModel.displayedHomeNotifications
        setHomeNotificationsTableViewSection()
    }

    func setHomeMenuTableViewSection  () {
        let homeMenuTableViewCell = HomeMenuTableViewCell()
        homeMenuTableViewCell.homeMenuOptions = homeMenuOptions
        homeMenuTableViewCell.delegate = self
        let firstSection = SaarahTableViewSection(headerView: EmptySectionHeaderView(), cells: [homeMenuTableViewCell])
        tableViewSections.append(firstSection)
        homeView.tableView.reloadData()
    }

    func setHomeNotificationsTableViewSection () {
        let secondSectionHeaderView = DefaultSectionHeaderView()
        secondSectionHeaderView.titleLabel.text = "NOTIFICAÇÕES"
        secondSectionHeaderView.rightButton.setTitle("VER TODAS", for: .normal)
        var secondSection = SaarahTableViewSection(headerView: secondSectionHeaderView, cells: [])

        displayedHomeNotifications.forEach { displayedHomeNotification in
            let cell = HomeNotificationTableViewCell()
            cell.messageLabel.text = displayedHomeNotification.message
            cell.emojiLabel.text = displayedHomeNotification.emoji
            cell.type = displayedHomeNotification.type
            secondSection.cells.append(cell)
        }

        tableViewSections.append(secondSection)
        homeView.tableView.reloadData()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewSections[section].cells.count
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return tableViewSections[section].headerView
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableViewSections[indexPath.section].cells[indexPath.row]
    }
}

extension HomeViewController: HomeMenuDelegate {
    func didSelectHomeMenuOption(_ option: HomeMenuOption) {
        let nextViewController = option.viewController
        router?.navigateTo(source: self, destination: nextViewController)
    }
}