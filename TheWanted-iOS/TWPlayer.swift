//
//  Player.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/23/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit
import CocoaLumberjack

class TWPlayer: NSObject {
    
    
    
    // MARK:- Properties
    
    
    let _id: String
    
    var id: String {
        get {
            return self._id
        }
    }
    
    
    var name: String?
    
    var position: TWGeoPoint?
    
    
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    
    
    // MARK:- Initializers
    
    
    init(id: String)
    {
        self._id = id
    }
    
    
    
    // MARK:- Methods
    
    
    
    
}