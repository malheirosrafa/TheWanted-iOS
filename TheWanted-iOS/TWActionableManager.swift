//
//  TWActionableManager.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/23/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import Foundation

class TWActionableManager {
    
    var actionables = Dictionary<String,TWActionable>()
    
    func addActionableWithId(id:String, actionable:TWActionable)
    {
        actionables[id] = actionable
    }
    
    func removeActionableWithId(id:String)
    {
        actionables[id] = nil
    }
    
}