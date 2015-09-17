//
//  TimeBox.swift
//  AppWatch
//
//  Created by Martin Kim Dung-Pham on 15.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import Foundation

public class TimeBox {
    public var startDate = NSDate()
    public var endDate = NSDate()
    
    public init() {
        
    }
    
    init(withString string: String) {
        let components = string.componentsSeparatedByString("\t")
        if 2 <= components.count {
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss ZZZ"
            
            startDate = dateFormatter.dateFromString(components[0] as String)!
            endDate = dateFormatter.dateFromString(components[1] as String)!
        }
    }
}