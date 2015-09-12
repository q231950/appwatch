//
//  ApplicationObserverControllerTest.swift
//  AppWatchLoginItem
//
//  Created by Martin Kim Dung-Pham on 12.09.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import XCTest
@testable import AppWatchLoginItem

class ApplicationObserverMock : ApplicationObserver {
    var didCallPersist = false
    
    override func persistObservations() {
        didCallPersist = true
    }
}

class ApplicationObserverControllerTest: XCTestCase {
    
    func testAddsObserverPerIdentifier() {
        let controllerUnderTest = ApplicationObserverController(identifiers: ["a", "b", "c"])
        XCTAssertEqual(controllerUnderTest.applicationObservers.count, 3)
    }
    
    func testPersistsObservations() {
        let controllerUnderTest = ApplicationObserverController(identifiers: ["a", "b", "c"])
        let mock1 = ApplicationObserverMock(applicationBundleIdentifier: "", timeBox: TimeBox(), timeWriter: TimeWriterMock())
        let mock2 = ApplicationObserverMock(applicationBundleIdentifier: "", timeBox: TimeBox(), timeWriter: TimeWriterMock())
        
        controllerUnderTest.applicationObservers = [mock1, mock2]
        
        controllerUnderTest.persistObservations()
        
        XCTAssertTrue(mock1.didCallPersist)
        XCTAssertTrue(mock2.didCallPersist)
    }

}
