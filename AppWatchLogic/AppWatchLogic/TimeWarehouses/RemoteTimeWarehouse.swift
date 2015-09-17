//
//  RemoteTimeWarehouse.swift
//  AppWatch
//
//  Created by Martin Kim Dung-Pham on 16.08.15.
//  Copyright © 2015 Martin Kim Dung-Pham. All rights reserved.
//

import CloudKit

class RemoteTimeWarehouse: TimeWarehouse {
    func timeBoxes(from: NSDate, to: NSDate, completion: ([TimeBox]?, NSError?) -> Void) {
        completion(nil, nil)
    }
}
