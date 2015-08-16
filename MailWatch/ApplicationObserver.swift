//
//  ApplicationObserver.swift
//  MailWatch
//
//  Created by Martin Kim Dung-Pham on 15.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Cocoa

class ApplicationObserver : NSObject {
    
    var applicationBundleIdentifier: String
    let timeBox = TimeBox()
//    let timeWriter = RemoteTimeWriter()
    let timeWriter = FileTimeWriter()
    
    init(applicationBundleIdentifier: String) {
        self.applicationBundleIdentifier = applicationBundleIdentifier
        super.init()
        
        setupNotifications()
    }
    
    private func setupNotifications() {
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: Selector("launchedApplication:"), name: NSWorkspaceDidLaunchApplicationNotification, object: nil)
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: Selector("terminatedApplication:"), name: NSWorkspaceDidTerminateApplicationNotification, object: nil)
    }
    
    func launchedApplication(sender: NSNotification) {
        if let bundleIdentifier = sender.userInfo!["NSApplicationBundleIdentifier"] {
            if (bundleIdentifier as! String == applicationBundleIdentifier) {
                observedApplicationDidLaunch()
            }
        }
    }
    
    func terminatedApplication(sender: NSNotification) {
        if let bundleIdentifier = sender.userInfo!["NSApplicationBundleIdentifier"] {
            if (bundleIdentifier as! String == applicationBundleIdentifier) {
                observedApplicationDidTerminate()
            }
        }
    }
    
    private func observedApplicationDidLaunch() {
        timeBox.startDate = NSDate()
    }
    
    private func observedApplicationDidTerminate() {
        timeBox.endDate = NSDate()
        timeWriter.writeTime(timeBox.startDate, endDate: timeBox.endDate, applicationBundleIdentifier: applicationBundleIdentifier)
    }
}
