//
//  PointModel.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 14/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit

import CocoaLumberjack

class LatLonModel: AnyObject {
    
    var lat: Double?
    var lon: Double?
    
    init(lat:Double, lon:Double) {
        DDLogVerbose("PointModel.init(lat: \(lat), lon: \(lon))")
        self.lat = lat
        self.lon = lon
    }
    
    init() {
        DDLogVerbose("PointModel.init()")
    }
}