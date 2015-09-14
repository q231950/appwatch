//
//  ApplicationObserverTest.swift
//  AppWatchLoginItem
//
//  Created by Martin Kim Dung-Pham on 10.09.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import XCTest
@testable import AppWatchLogic

class ApplicationObserverTest: XCTestCase {
    
    let timeWriterMock = TimeWriterMock()
    var applicationObserver: ApplicationObserver!
    let notification = NSNotification(name: "x", object: nil, userInfo: ["NSApplicationBundleIdentifier" : "com.elbedev.TestIdentifier"])
    
    override func setUp() {
        super.setUp()
        applicationObserver = ApplicationObserver(applicationBundleIdentifier: "com.elbedev.TestIdentifier", timeBox: TimeBox(), timeWriter:timeWriterMock)
        applicationObserver.didLaunchApplication(notification)
    }
    
    func testObservedApplicationDidLaunch() {
        XCTAssertTrue(applicationObserver.observedApplicationIsRunning)
    }
    
    func testObservedApplicationDidTerminate() {
        applicationObserver.didTerminateApplication(notification)
        XCTAssertFalse(applicationObserver.observedApplicationIsRunning)
    }
    
    func testPersistsWhenApplicationLaunched() {
        applicationObserver.persistObservations()
        XCTAssertTrue(timeWriterMock.didCallWriteTime)
    }
    
    func testNotPersistsWhenApplicationNotLaunched() {
        applicationObserver = ApplicationObserver(applicationBundleIdentifier: "com.elbedev.TestIdentifier", timeBox: TimeBox(), timeWriter:timeWriterMock)
        applicationObserver.persistObservations()
        XCTAssertFalse(timeWriterMock.didCallWriteTime)
    }
    
    func testPersistsAfterApplicationHasTerminated() {
        applicationObserver.didTerminateApplication(notification)
        applicationObserver.persistObservations()
        XCTAssertTrue(timeWriterMock.didCallWriteTime)
    }
    
}
