//
//  TimeBox.swift
//  MailWatch
//
//  Created by Martin Kim Dung-Pham on 15.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

class TimeBox : NSObject {
    var startDate = NSDate()
    var endDate: NSDate = NSDate() {
        didSet  {
            duration += endDate.timeIntervalSinceDate(startDate)
        }
    }
    
    private var duration:NSTimeInterval = 0
    
    override init() {
        super.init()
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("showDuration"), userInfo: nil, repeats: true)
    }
    
    func showDuration() {
        print("seconds since launch:\(duration)")
    }
}