//
//  TimeBoxTests.swift
//  MailWatch
//
//  Created by Martin Kim Dung-Pham on 16.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import XCTest
@testable import MailWatch

class TimeBoxTests: XCTestCase {
    
    func testTimeBoxFromString() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        let startDate = dateFormatter.dateFromString("2015-08-15 22:02:38 +0000")!
        let endDate = dateFormatter.dateFromString("2015-08-15 22:02:41 +0000")!
        let timeRecordString = "2015-08-15 22:02:38 +0000\t2015-08-15 22:02:41 +0000\t| com.apple.TextEdit"

        let timeBox = TimeBox(withString: timeRecordString)
        XCTAssertEqual(timeBox.startDate, startDate)
        XCTAssertEqual(timeBox.endDate, endDate)
    }
}
