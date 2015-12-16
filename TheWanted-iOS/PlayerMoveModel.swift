//
//  PlayerMoveModel.swift
//  TheWanted-iOS
//
//  Created by Rafael Malheiros on 14/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

class PlayerMoveModel {
    
    let player: Int
    let lat: Int
    let lon: Int
    
    init(player:Int, lat:Int, lon:Int) {
        self.player = player
        self.lat = lat
        self.lon = lon
    }
}