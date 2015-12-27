//
//  TWLocalPlayerManager.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/25/15.
//  Copyright © 2015 playr2. All rights reserved.
//


import CocoaLumberjack

class TWLocalPlayerManager {
    
    
    
    // MARK: Properties
    
    
    static let sharedInstance = TWLocalPlayerManager()
    
    var player:TWLocalPlayer?
    
    let noficationCenter = NSNotificationCenter.defaultCenter()
    
    
    
    // MARK: Initializers
    
    
    private init()
    {
        noficationCenter.addObserver(self, selector: "onLocalPlayerConnect:", name: TWLocalPlayerNotification.Connect, object: nil)
    }
    
    
    
    // MARK: Callbacks
    
    
    @objc func onLocalPlayerConnect(notification: NSNotification)
    {
        DDLogVerbose("TWLocalPlayerManager.onLocalPlayerConnect")
        
        let localPlayer = notification.object as! TWLocalPlayer
        player = localPlayer
    }
    
}