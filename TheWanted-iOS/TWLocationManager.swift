//
//  PlayerMoveManager.swift
//  TheWanted-iOS
//
//  Created by rafael on 14/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit
import CoreLocation

import CocoaLumberjack


class TWLocationManager: NSObject, CLLocationManagerDelegate {

    static let sharedInstance = TWLocationManager()
    
    let locationManager = CLLocationManager()
    
    let socket = TWServer.sharedInstance.socket
    
    
    override private init()
    {
        DDLogVerbose("PlayerMoveManager.init()")
        
        super.init()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 1
    
    }
    
    
    
    func startUpdatingLocation()
    {
        DDLogVerbose("PlayerMoveManager.startUpdatingLocation()")
        
        switch CLLocationManager.authorizationStatus() {
            
        case .AuthorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
            
        case .NotDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
            
        case .Restricted:
            print("Location Restricted")
            break
            
        default:
            break
        }
        
    }
    
    
    func stopUpdatingLocation()
    {
        DDLogVerbose("PlayerMoveManager.stopUpdatingLocation()")
        
        locationManager.stopUpdatingLocation()
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation)
    {
        DDLogVerbose("PlayerMoveManager.locationManager(manager, didUpdateToLocation, fromLocation)")
        
        let data:Dictionary<String, NSObject> = ["lat": newLocation.coordinate.latitude, "lon": newLocation.coordinate.longitude]
        
        TWMe.sharedInstance.player.position.lat = newLocation.coordinate.latitude
        TWMe.sharedInstance.player.position.lon = newLocation.coordinate.longitude
        
        socket.emit(TWNotification.Move, data)
        
        
        
        //        self.socket!.on("currentAmount") {data, ack in
        //            if let cur = data[0] as? Double {
        //                self.socket.emitWithAck("canUpdate", cur)(timeoutAfter: 0) {data in
        //                    socket.emit("update", ["amount": cur + 2.50])
        //                }
        //
        //                ack.with("Got your currentAmount", "dude")
        //            }
        //        }
    }
    
}
