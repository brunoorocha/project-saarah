//
//  HomeTableViewDataSource.swift
//  project-saarah
//
//  Created by Bruno Rocha on 21/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import UIKit

class HomeTableViewDataSource: NSObject {
    var notificationsViewModels: [Home.FetchHomeNotifications.ViewModel.DisplayedHomeNotification] = []
    var isShowingNotificationSkelectonCells = false
    weak var homeMenuCollectionViewDelegate: UICollectionViewDelegate?
    weak var homeMenuCollectionViewDataSource: UICollectionViewDataSource?

    enum HomeTableViewSections: Int, CaseIterable {
        case menu = 0
        case notifications

        var reuseIdentifier: String {
            switch self {
            case .menu:
                return "HomeMenuTableViewCell"
            case .notifications:
                return "HomeNotificationTableViewCell"
            }
        }

        var skelectonReuseIdentifier: String {
            switch self {
            case .menu:
                return ""
            case .notifications:
                return "HomeNotificationSkelectonTableViewCell"
            }
        }
    }

    var tableViewSections = HomeTableViewSections.allCases

    var skelectonCellsCount = 3

    func registerCells (for tableView: UITableView) {
        tableView.register(HomeMenuTableViewCell.self, forCellReuseIdentifier: HomeTableViewSections.menu.reuseIdentifier)
        tableView.register(HomeNotificationSkelectonTableViewCell.self, forCellReuseIdentifier: HomeTableViewSections.notifications.skelectonReuseIdentifier)
        tableView.register(HomeNotificationTableViewCell.self, forCellReuseIdentifier: HomeTableViewSections.notifications.reuseIdentifier)
    }

    func numberOfRows (in section: Int) -> Int {
        guard let section = HomeTableViewSections(rawValue: section) else { return 0 }
        switch section {
        case .menu:
            return 1
        case .notifications:
            return isShowingNotificationSkelectonCells ? skelectonCellsCount : notificationsViewModels.count
        }
    }

    func cell(for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let section = HomeTableViewSections(rawValue: indexPath.section) else { return UITableViewCell() }
        switch section {
        case .menu:
            return firstSectionCell(for: tableView, in: indexPath)
        case .notifications:
            return secondSectionCell(for: tableView, in: indexPath)
        }
    }

    func firstSectionCell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let homeMenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewSections.menu.reuseIdentifier, for: indexPath) as? HomeMenuTableViewCell else { return UITableViewCell() } // swiftlint:disable:this line_length
        homeMenuTableViewCell.homeMenuCollectionView.delegate = homeMenuCollectionViewDelegate
        homeMenuTableViewCell.homeMenuCollectionView.dataSource = homeMenuCollectionViewDataSource
        return homeMenuTableViewCell
    }

    func secondSectionCell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        if isShowingNotificationSkelectonCells {
            return notificationSkelectonCell(for: tableView, in: indexPath)
        }

        guard let notificationCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewSections.notifications.reuseIdentifier, for: indexPath) as? HomeNotificationTableViewCell else { return UITableViewCell() } // swiftlint:disable:this line_length
        let displayedHomeNotification = notificationsViewModels[indexPath.row]
        notificationCell.messageLabel.text = displayedHomeNotification.message
        notificationCell.emojiLabel.text = displayedHomeNotification.emoji
        notificationCell.type = displayedHomeNotification.type
        notificationCell.roundCellIfNeeded(index: indexPath.row, numberOfCells: notificationsViewModels.count)
        return notificationCell
    }

    func notificationSkelectonCell (for tableView: UITableView, in indexPath: IndexPath) -> UITableViewCell {
        guard let notificationSkelectonCell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewSections.notifications.skelectonReuseIdentifier, for: indexPath) as? HomeNotificationSkelectonTableViewCell else { return UITableViewCell() } // swiftlint:disable:this line_length
        notificationSkelectonCell.roundCellIfNeeded(index: indexPath.row, numberOfCells: skelectonCellsCount)
        return notificationSkelectonCell
    }

    func viewForHeader(in section: Int) -> UIView? {
        guard let section = HomeTableViewSections(rawValue: section) else { return nil }
        switch section {
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

extension HomeTableViewDataSource: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableViewSections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return cell(for: tableView, in: indexPath)
    }
}
