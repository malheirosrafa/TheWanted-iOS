//
//  TWRemotePlayerManager.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/23/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import CocoaLumberjack

class TWRemotePlayerManager {
    
    
    
    // MARK: Properties
    
    
    static let sharedInstance = TWRemotePlayerManager()
    
    var players = [String : TWRemotePlayer]()
    
    let noficationCenter = NSNotificationCenter.defaultCenter()
    
    
    
    // MARK: Initializers
    
    
    private init()
    {
        noficationCenter.addObserver(self, selector: "onRemotePlayerEnter:", name: TWRemotePlayerNotification.Enter, object: nil)
    }

    
    
    // MARK: Callbacks
    
    
    @objc func onRemotePlayerEnter(notification: NSNotification)
    {
        DDLogVerbose("TWRemotePlayerManager.onRemotePlayerEnter")
        
        let remotePlayer = notification.object as! TWRemotePlayer
        players[remotePlayer.id] = remotePlayer
    }
    
}