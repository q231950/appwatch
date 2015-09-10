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

    func testObservedApplicationDidLaunch() {
        let applicationObserver = ApplicationObserver(applicationBundleIdentifier: "com.apple.TextEdit")
        applicationObserver.didLaunchApplication(NSNotification(name: "x", object: nil, userInfo: ["NSApplicationBundleIdentifier" : "com.apple.TextEdit"]))
        XCTAssertTrue(applicationObserver.observedApplicationIsRunning)
    }
    
}
