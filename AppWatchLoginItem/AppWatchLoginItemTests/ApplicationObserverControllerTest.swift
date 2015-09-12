//
//  ApplicationObserverControllerTest.swift
//  AppWatchLoginItem
//
//  Created by Martin Kim Dung-Pham on 12.09.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import XCTest
@testable import AppWatchLoginItem

class ApplicationObserverControllerTest: XCTestCase {

    func testAddsObserverPerIdentifier() {
        let controllerUnderTest = ApplicationObserverController(identifiers: ["a", "b", "c"])
        XCTAssertEqual(controllerUnderTest.applicationObservers.count, 3)
    }

}
