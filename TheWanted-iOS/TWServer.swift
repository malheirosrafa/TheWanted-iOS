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

    
    
    // MARK:- Properties


    static let sharedInstance = TWServer()
    
    var socket:SocketIOClient = SocketIOClient(socketURL: "192.168.0.11.xip.io:3000", options: [.Log(false), .ForcePolling(true)])
    
    
    
    // MARK:- Lifecycle
    
    
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
        
        self.socket.on(TWRemotePlayerNotification.Enter, callback: onRemotePlayerEnter)
        self.socket.on(TWRemotePlayerNotification.Move, callback: onRemotePlayerMove)
        
        socket.connect()
    }
    
    
    
    // MARK:- SocketIO Callbacks
    
    
    func onConnect(data: [AnyObject], ack:SocketAckEmitter)
    {
            DDLogVerbose("Api.onConnect()");
        
            TWLocalPlayer(id: self.socket.sid!)
    }
    
    
    
    func onRemotePlayerEnter(remotePlayerListData: [AnyObject], ack:SocketAckEmitter)
    {
        DDLogVerbose("Api.onRemotePlayerEnter()");
        
        for remotePlayerData in remotePlayerListData {
            
            if let id = remotePlayerData["id"] as? String {
                TWRemotePlayer(id: id)
            }
        }
    }
    
    
    func onRemotePlayerMove(remotePlayerListData: [AnyObject], ack:SocketAckEmitter)
    {
        DDLogVerbose("Api.onRemotePlayerMove()");
        
        for remotePlayerData in remotePlayerListData {
            
            if let id = remotePlayerData["id"] as? String {
                
                if let lat  = remotePlayerData["lat"] as? Double {
                    
                    if let lon  = remotePlayerData["lon"] as? Double {
                        
                        if let remotePlayer =  TWRemotePlayerManager.sharedInstance.players[id]
                        {
                            remotePlayer.position = TWGeoPoint(lat: lat, lon: lon)
                            remotePlayer.notifyMove()
                        }
                        
                    }
                    
                }
                
            }
            
        }
    }
}
