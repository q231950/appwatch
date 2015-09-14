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
    private let selectableItems = ["TextEdit", "Mail"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerTitle.stringValue = "Usage"
        addSelectableApps()
        
//        let h = FileTimeWriter(fileName: "somefile.db")
//        let hous = AppWatchLogic.FileTimeWriter()
    }
    
    private func addSelectableApps() {
        appSelectionPopUpButton.addItemsWithTitles(selectableItems)
    }
    
    @IBAction func selectionPopUpButtonDidSelect(sender: NSPopUpButton) {
        
    }

}