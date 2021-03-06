//
//  TimeWriter.swift
//  AppWatch
//
//  Created by Martin Kim Dung-Pham on 15.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

public protocol TimeWriter {
    func writeTime(startDate: NSDate, endDate: NSDate, applicationBundleIdentifier: String)
}
