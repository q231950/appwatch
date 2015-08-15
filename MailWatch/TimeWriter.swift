//
//  TimeWriter.swift
//  MailWatch
//
//  Created by Martin Kim Dung-Pham on 15.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

class TimeWriter {
    func writeTime(startDate: NSDate, endDate: NSDate) {

        let fileManager = NSFileManager.defaultManager()
        
        let documentsPath = NSHomeDirectory() // NSSearchPathForDirectoriesInDomains(.UserDirectory, .UserDomainMask, true)[0] as NSString
        let filePath = documentsPath.stringByAppendingPathComponent(".mailwatch.db")
        
        if (!fileManager.fileExistsAtPath(filePath)) {
            fileManager.createFileAtPath(filePath, contents: NSData(), attributes: nil)
        }
        
        
        do {
            let fileString = try String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding) // String(contentsOfFile: filePath, usedEncoding: NSUTF8StringEncoding, error: nil)
            let updatedTimeRecord = fileString.stringByAppendingString("\t\(startDate)\t\(endDate)\n")
            try updatedTimeRecord.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
        } catch _ {
        
        }
    }
}
