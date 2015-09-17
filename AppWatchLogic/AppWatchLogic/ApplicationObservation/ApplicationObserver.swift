//
//  ApplicationObserver.swift
//  AppWatch
//
//  Created by Martin Kim Dung-Pham on 15.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Cocoa

public class ApplicationObserver : NSObject {
    
    let applicationBundleIdentifier: String
    let timeBox: TimeBox
    let timeWriter: TimeWriter
    var observedApplicationIsRunning = false
    
    public init(applicationBundleIdentifier: String, timeBox: TimeBox, timeWriter: TimeWriter) {
        self.applicationBundleIdentifier = applicationBundleIdentifier
        self.timeBox = timeBox
        self.timeWriter = timeWriter
        super.init()
        
        registerCurrentApplicationState()
        setupNotifications()
    }
    
    // MARK: Public
    
    public func persistObservations() {
        if observedApplicationIsRunning {
            observedApplicationDidTerminate()
        }
    }
    
    func didLaunchApplication(sender: NSNotification) {
        if let bundleIdentifier = sender.userInfo!["NSApplicationBundleIdentifier"] {
            if (bundleIdentifier as! String == applicationBundleIdentifier) {
                observedApplicationDidLaunch()
            }
        }
    }
    
    func didTerminateApplication(sender: NSNotification) {
        if let bundleIdentifier = sender.userInfo!["NSApplicationBundleIdentifier"] {
            if (bundleIdentifier as! String == applicationBundleIdentifier) {
                observedApplicationDidTerminate()
            }
        }
    }
    
    // MARK: Private
    
    private func registerCurrentApplicationState() {
        let workspace = NSWorkspace.sharedWorkspace()
        let applications = workspace.runningApplications
        for app in applications {
            if app.bundleIdentifier == self.applicationBundleIdentifier {
                observedApplicationDidLaunch()
            }
        }
    }
    
    private func setupNotifications() {
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: Selector("didLaunchApplication:"), name: NSWorkspaceDidLaunchApplicationNotification, object: nil)
        NSWorkspace.sharedWorkspace().notificationCenter.addObserver(self, selector: Selector("didTerminateApplication:"), name: NSWorkspaceDidTerminateApplicationNotification, object: nil)
    }
    
    private func observedApplicationDidLaunch() {
        timeBox.startDate = NSDate()
        observedApplicationIsRunning = true
    }
    
    private func observedApplicationDidTerminate() {
        if (observedApplicationIsRunning) {
            timeBox.endDate = NSDate()
            timeWriter.writeTime(timeBox.startDate, endDate: timeBox.endDate, applicationBundleIdentifier: applicationBundleIdentifier)
            observedApplicationIsRunning = false
        }
    }
}
