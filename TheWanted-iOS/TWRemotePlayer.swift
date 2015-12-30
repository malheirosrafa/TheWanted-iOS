//
//  TWRemotePlayer.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/25/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import CoreLocation

import CocoaLumberjack

class TWRemotePlayer: TWPlayer{
    
    
    
    override init(id: String)
    {
        DDLogVerbose("TWRemotePlayer.init(id: \(id))")
        super.init(id: id)
        
        self.notifyEnter()
    }
    
    
    
    // MARK:- Methods
    
    func notifyEnter()
    {
        DDLogVerbose("TWRemotePlayer.notifyEnter()")
        
        notificationCenter.postNotificationName(TWRemotePlayerNotification.Enter, object: self)
    }
    
    func notifyLeave()
    {
        DDLogVerbose("TWRemotePlayer.notifyLeave()")
        
        notificationCenter.postNotificationName(TWRemotePlayerNotification.Leave, object: self)
    }
    
    func notifyMove()
    {
        DDLogVerbose("TWRemotePlayer.notifyMove()")
        
        notificationCenter.postNotificationName(TWRemotePlayerNotification.Move, object: self)
    }
    
    func notifyDamage()
    {
        DDLogVerbose("TWRemotePlayer.notifyDamage()")
        
        notificationCenter.postNotificationName(TWRemotePlayerNotification.Damage, object: self)
    }
}