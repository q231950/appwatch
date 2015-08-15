//
//  RemoteTimeWriter.swift
//  MailWatch
//
//  Created by Martin Kim Dung-Pham on 15.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import CloudKit

class RemoteTimeWriter : TimeWriter {
    func writeTime(startDate: NSDate, endDate: NSDate, applicationBundleIdentifier: String) {
        let timeRecord = CKRecord(recordType: "Time")
        
        timeRecord["startDate"] = startDate
        timeRecord["endDate"] = endDate
        timeRecord["appBundleID"] = applicationBundleIdentifier
        
        let privateDatabase = CKContainer.defaultContainer().privateCloudDatabase
        privateDatabase.saveRecord(timeRecord, completionHandler: { (record:CKRecord?, error:NSError?) -> Void in
            if (error != nil) {
                print("error \(error) occurred while saving \(timeRecord)")
            }
        })
    }
}
