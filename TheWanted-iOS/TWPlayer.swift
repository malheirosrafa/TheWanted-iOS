//
//  Player.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/23/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit
import CocoaLumberjack

class TWPlayer: TWActionable, TWMovable, TWSpawnable {
    
    var marker = TWPlayerMarkerView()
    
    var actionList:[TWAction] = [TWAction]()
    
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    init()
    {
        
        setupMarker()
    }
    
    func setupMarker()
    {
        
    }
    
    
    func moveTo(position: CGPoint)
    {
        marker.layer.position = position
    }
    
    func spawn()
    {
        notificationCenter.postNotificationName(TWNotification.Spawn, object: self)
    }
    
    
}