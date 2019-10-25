//
//  HomePresenterTests.swift
//  project-saarah-tests
//
//  Created by Bruno Rocha on 11/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import XCTest
@testable import eStorage

class HomePresenterTests: XCTestCase {
    // MARK: - Mocked Classes
    fileprivate class MockedHomeDisplayLogic: HomeDisplayLogic {
        var viewModel: Home.FetchHomeNotifications.ViewModel!
        var displayHomeNotificationWasCalled = false

        func displayHomeNotifications(viewModel: Home.FetchHomeNotifications.ViewModel) {
            displayHomeNotificationWasCalled = true
            self.viewModel = viewModel
        }
    }

    var homePresenter: HomePresenter!

    // MARK: - Test Lifecycle Methods
    override func setUp() {
        super.setUp()
        homePresenter = HomePresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Test Cases
    func testPresentHomeNotifications_whenSuccessfullyFormatResponse () {
        let mockedHomeDisplayLogic = MockedHomeDisplayLogic()
        homePresenter.viewController = mockedHomeDisplayLogic

        let notification = HomeNotification(emoji: "🚨", message: "A sample message", type: .warning)

        let response = Home.FetchHomeNotifications.Response(notifications: [notification])
        homePresenter.presentHomeNotifications(response: response)

        let displayedNotifications = mockedHomeDisplayLogic.viewModel.displayedHomeNotifications
        displayedNotifications.forEach { displayedHomeNotification in
            XCTAssertEqual(displayedHomeNotification.emoji, "🚨", "The presentation logic should properly format the home notification emoji")
            XCTAssertEqual(displayedHomeNotification.message, "A sample message", "The presentation logic should properly format the home notification message")
            XCTAssertEqual(displayedHomeNotification.type, HomeNotificationType.warning, "The presentation logic should properly format the home notification type")
        }
    }

    func testPresentHomeNotifications_whenSuccessfulyAskViewControllerToDisplayFetchedNotifications () {
        let mockedHomeDisplayLogic = MockedHomeDisplayLogic()
        homePresenter.viewController = mockedHomeDisplayLogic

        let response = Home.FetchHomeNotifications.Response(notifications: LocalHomeNotificationStore.notifications)
        homePresenter.presentHomeNotifications(response: response)

        XCTAssert(mockedHomeDisplayLogic.displayHomeNotificationWasCalled, "The HomePresenter should call the view controller to display the fetched home notifications")
    }
}
