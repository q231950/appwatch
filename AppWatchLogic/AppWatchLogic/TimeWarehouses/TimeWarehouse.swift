//
//  TimeWarehouse.swift
//  AppWatch
//
//  Created by Martin Kim Dung-Pham on 16.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

extension NSDate {
    func endedWithinRange(from: NSDate, to: NSDate) -> Bool {
        return (self.compare(to) == NSComparisonResult.OrderedAscending && self.compare(from) == NSComparisonResult.OrderedDescending) || self.compare(to) == NSComparisonResult.OrderedSame
    }
    
    func beganWithinRange(from: NSDate, to: NSDate) -> Bool {
        return (self.compare(to) == NSComparisonResult.OrderedDescending && self.compare(from) == NSComparisonResult.OrderedAscending ) || self.compare(from) == NSComparisonResult.OrderedSame
    }
}

protocol TimeWarehouse {
    func timeBoxes(from: NSDate, to: NSDate, completion: ([TimeBox]?, NSError?) -> Void)
}