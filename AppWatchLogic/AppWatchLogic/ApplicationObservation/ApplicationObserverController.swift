//
//  ApplicationObserverController.swift
//  AppWatchLoginItem
//
//  Created by Martin Kim Dung-Pham on 12.09.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

public class ApplicationObserverController {
    internal var applicationObservers: [ApplicationObserver] = [ApplicationObserver]()
    
    public init(identifiers: [String]) {
        for identifier in identifiers {
            addApplicationObserver(identifier)
        }
    }
    
    public func persistObservations() {
        for applicationObserver in applicationObservers {
            applicationObserver.persistObservations()
        }
    }
    
    private func addApplicationObserver(identifier: String) {
        let timeWriter = FileTimeWriter(fileName: ".appwatch.db") // RemoteTimeWriter()
        let observer = ApplicationObserver(applicationBundleIdentifier: identifier, timeBox: TimeBox(), timeWriter:timeWriter)
        applicationObservers.append(observer)
    }
   
}
