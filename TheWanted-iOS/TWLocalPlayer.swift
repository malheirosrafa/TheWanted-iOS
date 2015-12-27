//
//  TWLocalPlayer.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/25/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import CoreLocation

import CocoaLumberjack

class TWLocalPlayer: TWPlayer, CLLocationManagerDelegate {

    
    
    let locationManager = CLLocationManager()
    
    //TODO: Tirar essa porra daqui
    let socket = TWServer.sharedInstance.socket
    
    
    override init(id: String)
    {
        DDLogVerbose("TWLocalPlayer.init(id: \(id))")
        super.init(id: id)
        
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.distanceFilter = 1
        
        self.notifyConnect()
        //startUpdatingLocation()
    }
    
    
    func startUpdatingLocation()
    {
        DDLogVerbose("TWLocalPlayer.startUpdatingLocation()")
        
        switch CLLocationManager.authorizationStatus() {
            
        case .AuthorizedWhenInUse:
            self.locationManager.startUpdatingLocation()
            break
            
        case .NotDetermined:
            self.locationManager.requestWhenInUseAuthorization()
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
        DDLogVerbose("TWLocalPlayer.stopUpdatingLocation()")
        
        self.locationManager.stopUpdatingLocation()
    }
    
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation)
    {
        DDLogVerbose("TWLocalPlayer.locationManager(manager, didUpdateToLocation, fromLocation)")
        
        let data:Dictionary<String, NSObject> = ["lat": newLocation.coordinate.latitude, "lon": newLocation.coordinate.longitude]
        
        let newGeoPoint = TWGeoPoint(lat: newLocation.coordinate.latitude, lon: newLocation.coordinate.longitude)
        self.position = newGeoPoint
        
        self.notifyMove()
        
        //TODO: Tirar essa porra daqui
        self.socket.emit(TWLocalPlayerNotification.Move, data)
    }
    
    
    
    func notifyConnect()
    {
        DDLogVerbose("TWLocalPlayer.notifyConnect()")
        
        self.notificationCenter.postNotificationName(TWLocalPlayerNotification.Connect, object: self)
        self.startUpdatingLocation()
    }
    
    func notifyDisconnect()
    {
        DDLogVerbose("TWLocalPlayer.notifyDisconnect()")
        
        self.notificationCenter.postNotificationName(TWLocalPlayerNotification.Disconnect, object: self)
        self.stopUpdatingLocation()
    }
    
    func notifyMove()
    {
        DDLogVerbose("TWLocalPlayer.notifyMove()")
        
        self.notificationCenter.postNotificationName(TWLocalPlayerNotification.Move, object: self)
    }

}