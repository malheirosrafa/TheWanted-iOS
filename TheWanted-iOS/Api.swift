//
//  Api.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 14/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import Socket_IO_Client_Swift

class Api {


    static let sharedInstance = Api()

    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    var socket:SocketIOClient = SocketIOClient(socketURL: "192.168.0.9.xip.io:3000", options: [.Log(false), .ForcePolling(true)])
    
    private init() {
        
        self.socket.on("connect") {data, ack in
            print("socket connected")
        }
        
        
        setupIncome()
        
        socket.connect()
    }
    

    deinit
    {
        socket.disconnect()
    }
    
    
    // MARK: Income notifications coming from socket.io
    
    /**
        Setup The
    */
    private func setupIncome()
    {
        setupOnActionableSpawn()
        setupOnActionableMove()
    }
    
    
    private func setupOnActionableSpawn() {
        self.socket.on(TWActionableNotification.Spawn) {data, ack in
            print("spawn", data)
        }
    }
    
    func onActionableSpawn(notification: NSNotification) {
        notificationCenter.postNotificationName(TWActionableNotification.Move, object: self)
    }
    
    
    private func setupOnActionableMove() {
        self.socket.on(TWActionableNotification.Move) {data, ack in
            print("move", data)
        }
    }
    
    func onActionableMove(notification: NSNotification) {
        notificationCenter.postNotificationName(TWActionableNotification.Move, object: self)
    }
    
    
    
    
}
