//
//  TWGeoPoint.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 14/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit

import CocoaLumberjack

struct TWGeoPoint {
    
    let lat: Double
    let lon: Double
    
    init(lat:Double, lon:Double) {
        DDLogVerbose("PointModel.init(lat: \(lat), lon: \(lon))")
        self.lat = lat
        self.lon = lon
    }
}