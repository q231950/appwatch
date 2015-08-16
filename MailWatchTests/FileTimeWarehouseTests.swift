//
//  FileTimeWarehouseTests.swift
//  MailWatch
//
//  Created by Martin Kim Dung-Pham on 16.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import XCTest
@testable import MailWatch

class FileTimeWarehouseTests: XCTestCase {
    
    var timeWarehouse: FileTimeWarehouse? = nil
    
    override func setUp() {
        super.setUp()
        
        let filePath = NSBundle(identifier: "com.elbedev.MailWatchTests")!.pathForResource("FileTimeWarehouseTestsSampleFile", ofType: "db")
        timeWarehouse = FileTimeWarehouse(filePath: filePath!)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTimeBoxesCount() {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
        let fromDate = dateFormatter.dateFromString("2015-08-15 14:56:01 +0000")!
        let toDate = dateFormatter.dateFromString("2015-08-15 21:58:44 +0000")!
        
        let expectation = expectationWithDescription("completion will be called")
        timeWarehouse!.timeBoxes(fromDate, to: toDate, completion: { (timeBoxes: [TimeBox]?, error: NSError?) -> Void in
            XCTAssertEqual(7, timeBoxes!.count)
            expectation.fulfill()
        })
        
        waitForExpectationsWithTimeout(1, handler: nil)
    }
}
