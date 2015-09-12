//
//  ApplicationObserverController.swift
//  AppWatchLoginItem
//
//  Created by Martin Kim Dung-Pham on 12.09.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

class ApplicationObserverController {
    private var applicationObservers: [ApplicationObserver] = [ApplicationObserver]()
    
    init() {
        addApplicationObservers()
    }
    
    func persistObservations() {
        for applicationObserver in applicationObservers {
            applicationObserver.persistObservations()
        }
    }
    
    private func addApplicationObservers() {
        let timeWriter = FileTimeWriter() // RemoteTimeWriter()
        let textEditApplicationObserver = ApplicationObserver(applicationBundleIdentifier: "com.apple.TextEdit", timeBox: TimeBox(), timeWriter:timeWriter)
        applicationObservers.append(textEditApplicationObserver)
        
        let mailApplicationObserver = ApplicationObserver(applicationBundleIdentifier: "com.apple.mail", timeBox: TimeBox(), timeWriter:timeWriter)
        applicationObservers.append(mailApplicationObserver)
    }
}