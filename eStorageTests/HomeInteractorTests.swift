//
//  HomeInteractorTests.swift
//  project-saarah-tests
//
//  Created by Bruno Rocha on 11/10/19.
//  Copyright © 2019 Bruno Rocha. All rights reserved.
//

import XCTest
@testable import eStorage

class HomeInteractorTests: XCTestCase {

    // MARK: - Mocked Classes
    fileprivate class MockedHomePresenter: HomePresentationLogic {
        var presentHomeNotificationsWasCalled = false

        func presentHomeNotifications(response: Home.FetchHomeNotifications.Response) {
            presentHomeNotificationsWasCalled = true
        }
    }

    fileprivate class MockedHomeNotificationsWorker: HomeNotificationsWorker {
        var fetchHomeNotificationsWasCalled = false

        override func fetchNotifications(completionHandler: @escaping ([HomeNotification]) -> Void) {
            fetchHomeNotificationsWasCalled = true
            completionHandler([])
        }
    }

    var homeInteractor: HomeInteractor!

    // MARK: - Test Lifecycle Methods
    override func setUp() {
        super.setUp()
        homeInteractor = HomeInteractor()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: - Test Cases
    func testFetchHomeNotifications_whenSuccessfulyFetchNotifications_thenIsPresented() {
        let mockedPresenter = MockedHomePresenter()
        let mockedWorker = MockedHomeNotificationsWorker(notificationStore: LocalHomeNotificationStore())

        homeInteractor.homeNotificationWorker = mockedWorker
        homeInteractor.presenter = mockedPresenter

        let request = Home.FetchHomeNotifications.Request()
        homeInteractor.fetchHomeNotifications(request: request)

        XCTAssert(mockedWorker.fetchHomeNotificationsWasCalled, "fetchHomeNotifications() should ask to worker to fetch notifications")
        XCTAssert(mockedPresenter.presentHomeNotificationsWasCalled, "fetchHomeNotifications() should ask to presenter to format the fetched notifications")
    }
}
