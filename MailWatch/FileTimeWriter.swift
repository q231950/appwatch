//
//  FileTimeWriter.swift
//  MailWatch
//
//  Created by Martin Kim Dung-Pham on 15.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

class FileTimeWriter : TimeWriter {
    
    internal let fileName: String
    
    init(fileName: String) {
        self.fileName = fileName
    }
    
    func writeTime(startDate: NSDate, endDate: NSDate, applicationBundleIdentifier: String) {

        let fileManager = NSFileManager.defaultManager()
        
        let documentsPath = NSHomeDirectory()
        let filePath = documentsPath.stringByAppendingString("/" + fileName)
        
        if (!fileManager.fileExistsAtPath(filePath)) {
            fileManager.createFileAtPath(filePath, contents: NSData(), attributes: nil)
        }
        
        do {
            let fileString = try String(contentsOfFile: filePath, encoding: NSUTF8StringEncoding)
            let updatedTimeRecord = fileString.stringByAppendingString("\t\(startDate)\t\(endDate)\t|\t\(applicationBundleIdentifier)\n")
            try updatedTimeRecord.writeToFile(filePath, atomically: true, encoding: NSUTF8StringEncoding)
        } catch _ {
            print("Unable to write time to file.")
        }
    }
}
