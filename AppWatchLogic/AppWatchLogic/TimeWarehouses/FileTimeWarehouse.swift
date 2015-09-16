//
//  FileTimeWarehouse.swift
//  MailWatch
//
//  Created by Martin Kim Dung-Pham on 16.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

public class FileTimeWarehouse : TimeWarehouse {
    
    var file: String?
    
    public init(filePath: String) {
        do {
            file = try String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
        } catch _ {
            
        }
    }
    
    public func timeBoxes(from: NSDate, to: NSDate, completion: ([TimeBox]?, NSError?) -> Void) {
        if let file = self.file as String! {
            let lines = file.componentsSeparatedByString("\n")
            var timeBoxes = [TimeBox]()
            for line in lines {
                let timeBox = TimeBox(withString: line)
                if timeBox.endDate.endedWithinRange(from, to: to) || timeBox.startDate.beganWithinRange(from, to: to) {
                    timeBoxes.append(timeBox)
                }
            }
            completion(timeBoxes, nil)
        }
    }
}