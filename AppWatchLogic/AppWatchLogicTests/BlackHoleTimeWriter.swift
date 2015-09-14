//
//  BlackHoleTimeWriter.swift
//  AppWatchLoginItem
//
//  Created by Martin Kim Dung-Pham on 12.09.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation
@testable import AppWatchLogic

class TimeWriterMock: TimeWriter {
    
    var didCallWriteTime = false
    
    func writeTime(startDate: NSDate, endDate: NSDate, applicationBundleIdentifier: String) {
        // does nothing except noticing calls, black hole sucks in everything
        didCallWriteTime = true
    }
}
