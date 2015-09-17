//
//  StatisticsViewController.swift
//  AppWatch
//
//  Created by Martin Kim Dung-Pham on 13.09.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import AppKit
import AppWatchLogic

class StatisticsViewController: NSViewController {
    
    @IBOutlet weak var headerTitle: NSTextField!
    @IBOutlet weak var appSelectionPopUpButton: NSPopUpButton!
    private let selectableItems = ["TextEdit", "App"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerTitle.stringValue = "Usage"
        addSelectableApps()
        
        let documentsPath = NSHomeDirectory()
        let fileName = ".appwatch.db"
        let filePath = documentsPath.stringByAppendingString("/" + fileName)
        
        let fileTimeWarehouse = FileTimeWarehouse(filePath: filePath)
        fileTimeWarehouse.timeBoxes(NSDate(timeIntervalSinceNow: -36000), to: NSDate()) { (timeBoxes: [TimeBox]?, error: NSError?) -> Void in
            for timeBox in timeBoxes! {
                print("box \(timeBox.startDate), \(timeBox.endDate)")
            }
        }
    }
    
    private func addSelectableApps() {
        appSelectionPopUpButton.addItemsWithTitles(selectableItems)
    }
    
    @IBAction func selectionPopUpButtonDidSelect(sender: NSPopUpButton) {
        
    }

}