//
//  TWActionableManager.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/23/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import Foundation

class TWNotificableManager {
    
    
    static let sharedInstance = TWNotificableManager()
    
    var notificables = Dictionary<String,TWNotificable>()
    
    
    private init()
    {
    
    }

    func addNotificableWithId(id:String, notificable:TWNotificable)
    {
        notificables[id] = notificable
    }
    
    func removeNotificableWithId(id:String)
    {
        notificables[id] = nil
    }
    
}