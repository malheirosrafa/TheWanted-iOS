//
//  PlayerModel.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/19/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import CocoaLumberjack

class PlayerModel: AnyObject {
    
    var id: String?
    var name: String?
    let position: LatLonModel = LatLonModel()
    
    init() {
        DDLogVerbose("PlayerModel.init()")
    }
}
