//
//  AppDelegate.swift
//  MailWatch
//
//  Created by Martin Kim Dung-Pham on 15.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(NSSquareStatusItemLength)
    let textEditApplicationObserver = ApplicationObserver(applicationBundleIdentifier: "com.apple.TextEdit")
    let mailApplicationObserver = ApplicationObserver(applicationBundleIdentifier: "com.apple.mail")


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        setupStatusBarIcon()
        setupStatusMenu()
    
//
//        
//        
//        // Print all log entries
//        let dateFormatter = NSDateFormatter()
//        dateFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
//        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss.SSS"
//        SystemLog.readAllLogEntries { entry in
//            let timestamp = dateFormatter.stringFromDate(entry.date)
//            print("\(timestamp) [\(entry.PID)] \(entry.levelDescription): \(entry.message)")
//        }
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    private func setupStatusBarIcon() {
        if let button = statusItem.button {
            button.image = NSImage(named: "statusBarIcon")
        }
    }
    
    private func setupStatusMenu() {
        let menu = NSMenu()
        menu.addItem(NSMenuItem(title: "Running?", action: Selector("printQuote:"), keyEquivalent: "P"))
        menu.addItem(NSMenuItem.separatorItem())
        menu.addItem(NSMenuItem(title: "Quit", action: Selector("terminate:"), keyEquivalent: "q"))
        
        statusItem.menu = menu
    }
    
    func printQuote(sender: AnyObject) {
        let quoteText = "Never put off until tomorrow what you can do the day after tomorrow."
        let quoteAuthor = "Mark Twain"
        
        print("\(quoteText) — \(quoteAuthor)")
    }
}

