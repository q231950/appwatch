//
//  FileTimeWriterTest.swift
//  AppWatchLoginItem
//
//  Created by Martin Kim Dung-Pham on 12.09.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import XCTest
@testable import AppWatchLogic

class TimeWriterTests: XCTestCase {
    
    func testFileTimeWriter() {
        let fileTimeWriter = FileTimeWriter(fileName: "test.db")
        XCTAssertEqual(fileTimeWriter.fileName, "test.db")
    }

}