//
//  ApplicationObserverTest.swift
//  AppWatchLoginItem
//
//  Created by Martin Kim Dung-Pham on 10.09.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import XCTest
@testable import AppWatchLoginItem

class ApplicationObserverTest: XCTestCase {
    
    let applicationObserver = ApplicationObserver(applicationBundleIdentifier: "com.apple.TextEdit", timeBox: TimeBox(), timeWriter:FileTimeWriter())
    let notification = NSNotification(name: "x", object: nil, userInfo: ["NSApplicationBundleIdentifier" : "com.apple.TextEdit"])
    
    override func setUp() {
        super.setUp()
        applicationObserver.didLaunchApplication(notification)
    }
    
    func testObservedApplicationDidLaunch() {
        XCTAssertTrue(applicationObserver.observedApplicationIsRunning)
    }
    
    func testObservedApplicationDidTerminate() {
        applicationObserver.didTerminateApplication(notification)
        XCTAssertFalse(applicationObserver.observedApplicationIsRunning)
    }
    
}
