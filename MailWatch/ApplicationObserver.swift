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
    
    init(applicationBundleIdentifier: String) {
        self.applicationBundleIdentifier = applicationBundleIdentifier
        super.init()
        
        setupNotifications()
    }
    
    private func setupNotifications() {
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: Selector("launchedApplication:"), name: NSWorkspaceDidLaunchApplicationNotification, object: nil)
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: Selector("terminatedApplication:"), name: NSWorkspaceDidTerminateApplicationNotification, object: nil)
    }
    
    func launchedApplication(sender: AnyObject) {
        if let bundleIdentifier = sender.userInfo!["NSApplicationBundleIdentifier"] {
            print("launched \(bundleIdentifier)")
        }
    }
    
    func terminatedApplication(sender: AnyObject) {
        if let bundleIdentifier = sender.userInfo!["NSApplicationBundleIdentifier"] {
            print("terminated \(bundleIdentifier)")
        }
    }
}
