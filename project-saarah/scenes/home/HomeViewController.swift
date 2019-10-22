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

protocol HomeDisplayLogic: class {
    func displayHomeNotifications (viewModel: Home.FetchHomeNotifications.ViewModel)
}

class HomeViewController: SaarahViewController {
	// MARK: Property
	var interactor: HomeBusinessLogic?
	var router: (NSObjectProtocol & HomeRoutingLogic & HomeDataPassing)?
    private var homeTableViewDataSource = HomeTableViewDataSource()
    private var homeMenuCollectionViewDataSource = HomeMenuCollectionViewDataSource()
    private var isLoadingHomeNotifications = false {
        didSet {
            homeTableViewDataSource.isShowingNotificationSkelectonCells = self.isLoadingHomeNotifications
            homeView.tableView.reloadData()
        }
    }

    private var homeView = HomeView()

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        HomeBuilder.build(aroundViewController: self)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        HomeBuilder.build(aroundViewController: self)
    }

	// MARK: View lifecycle
	override func viewDidLoad() {
		super.viewDidLoad()
        defaultViewControllerConfiguration()
		requestHomeNotifications()
	}

    func defaultViewControllerConfiguration () {
        title = Localization(.homeScene(.title)).description
        view = homeView
        homeView.tableView.delegate = self
        homeTableViewDataSource.registerCells(for: homeView.tableView)
        homeTableViewDataSource.homeMenuCollectionViewDataSource = homeMenuCollectionViewDataSource
        homeTableViewDataSource.homeMenuCollectionViewDelegate = self
        homeView.tableView.dataSource = homeTableViewDataSource
    }

    func requestHomeNotifications () {
        let request = Home.FetchHomeNotifications.Request()
        interactor?.fetchHomeNotifications(request: request)
        isLoadingHomeNotifications = true
    }
}

extension HomeViewController: HomeDisplayLogic {
    func displayHomeNotifications (viewModel: Home.FetchHomeNotifications.ViewModel) {
        homeTableViewDataSource.notificationsViewModels = viewModel.displayedHomeNotifications
        isLoadingHomeNotifications = false
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let homeSection = HomeView.HomeTableViewSections(rawValue: section) else { return nil }
        switch homeSection {
        case .menu:
            return EmptySectionHeaderView()
        case .notifications:
            let headerView = DefaultSectionHeaderView()
            headerView.titleLabelText = Localization(.homeScene(.notification)).description
            headerView.rightButtonText = Localization(.seeAll).description
            return headerView
        }
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let selectedHomeMenuOption = HomeMenuOption(rawValue: indexPath.row) else { return }
        switch selectedHomeMenuOption {
        case .inventory:
            router?.navigateToInventory()
        case .menu:
            router?.navigateToDishesMenu()
        case .measurers:
            router?.navigateToMeasurers()
        case .settings:
            router?.navigateToSettings()
        }
    }
}
