//
//  TWServer.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 14/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import Socket_IO_Client_Swift

import CocoaLumberjack

class TWServer {

    
    
    // MARK: Properties


    static let sharedInstance = TWServer()
    
    var socket:SocketIOClient = SocketIOClient(socketURL: "192.168.0.11.xip.io:3000", options: [.Log(false), .ForcePolling(true)])
    
    
    
    // MARK: Lifecycle
    
    
    private init()
    {
        DDLogVerbose("Api.init()")
        
        initSocketIO()
    }
    

    deinit
    {
        DDLogVerbose("Api.deinit")
        socket.disconnect()
    }
    
    
    func initSocketIO()
    {
        DDLogVerbose("Api.initSocketIO()");
        
        self.socket.on("connect", callback: onConnect)
        
        self.socket.on(TWNotification.Spawn, callback: onNotificableSpawn)
        self.socket.on(TWNotification.Move, callback: onNotificableMove)
        
        socket.connect()
    }
    
    
    
    // MARK: SocketIO Callbacks
    
    
    func onConnect(data: Array<AnyObject>, ack:SocketAckEmitter)
    {
            DDLogVerbose("Api.onConnect()");
        
            TWMe.sharedInstance.player.id = self.socket.sid!
    }
    
    
    
    func onNotificableSpawn(spawnableListData: Array<AnyObject>, ack:SocketAckEmitter)
    {
        DDLogVerbose("Api.onNotificableSpawn()");
        
        for spawableData in spawnableListData {
            
            if let id = spawableData["id"] as? String {
                
                let player = TWPlayer()
                TWNotificableManager.sharedInstance.notificables[id] = player
                player.spawn()
            }
        }
    }
    
    
    func onNotificableMove(movableListData: Array<AnyObject>, ack:SocketAckEmitter)
    {
        DDLogVerbose("Api.onNotificableMove");
        
        for movableData in movableListData {
            
            if let id = movableData["id"] as? String {
                
                if let lat  = movableData["lat"] as? Double {
                    
                    if let lon  = movableData["lon"] as? Double {
                        
                        if TWNotificableManager.sharedInstance.notificables[id] == nil
                        {
                            let player = TWPlayer()
                            TWNotificableManager.sharedInstance.notificables[id] = player
                            player.spawn()
                        }
                        
                        
                        let myLat = TWMe.sharedInstance.player.position.lat
                        let myLon = TWMe.sharedInstance.player.position.lon
                        
                        let relativeLat = lat - myLat!
                        let relativeLon = lon - myLon!
                        
                        let distanceMultiplyer = 1000000.0
                        
                        let newX = relativeLon * distanceMultiplyer
                        let newY = -(relativeLat * distanceMultiplyer)
                        
                        let movable = TWNotificableManager.sharedInstance.notificables[id] as! TWMovable
                        movable.moveTo(CGPoint(x: newX, y: newY))
                        
                    }
                    
                }
                
            }
            
        }
    }
}
