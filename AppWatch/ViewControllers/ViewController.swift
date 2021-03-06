//
//  ViewController.swift
//  AppWatch
//
//  Created by Martin Kim Dung-Pham on 23.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import AppKit

class ViewController: NSViewController {
    
    let autoLoginEnabledKey = "autoLoginEnabled"
    
    override func viewDidLoad() {
        let enabled: Bool = NSUserDefaults.standardUserDefaults().boolForKey(autoLoginEnabledKey)
        segmentedControl.setSelected(enabled, forSegment: 0)
        segmentedControl.setSelected(!enabled, forSegment: 1)
    }
    
    @IBOutlet weak var segmentedControl: NSSegmentedControl! {
        didSet {
            print(segmentedControl)
        }
    }
    
    @IBAction func selectedSegment(sender: AnyObject) {
        print(segmentedControl.selectedSegment)
        switch segmentedControl.selectedSegment {
        case 0:
            setLoginItemEnabled(true)
        case 1:
            setLoginItemEnabled(false)
        default:
            break
        }
    }
    
    private func setLoginItemEnabled(enabled: Bool) {
        let identifier: CFStringRef = "com.elbedev.AppWatch.AppWatchLoginItem"
        
        if SMLoginItemSetEnabled(identifier, Bool(enabled)) {
            NSUserDefaults.standardUserDefaults().setBool(enabled, forKey: autoLoginEnabledKey)
            segmentedControl.setSelected(true, forSegment: enabled ? 0 : 1)
        }
    }
    
}
