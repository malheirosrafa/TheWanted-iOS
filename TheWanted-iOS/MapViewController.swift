//
//  MapViewController.swift
//  TheWanted-iOS
//
//  Created by rafael on 04/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit
import CoreLocation
import Socket_IO_Client_Swift


class MapViewController: UIViewController, CLLocationManagerDelegate {

    
    let wheelView = WheelView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    let locationManager = CLLocationManager()
    
    var socket:SocketIOClient = SocketIOClient(socketURL: "localhost:3000", options: [.Log(true), .ForcePolling(true)])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.socket.on("connect") {data, ack in
            print("socket connected")
        }
        
        socket.connect()
        
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = 10
        checkCoreLocationPermission()
        
        setupWheelView()
        
        
        
        
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
    
    override func viewWillDisappear(animated: Bool) {
        locationManager.stopUpdatingLocation()
        socket.disconnect()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }

    
    func setupWheelView() {

        wheelView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(wheelView)
        
        let horizontalConstraint = NSLayoutConstraint(item: wheelView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        
        let verticalConstraint = NSLayoutConstraint(item: wheelView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: wheelView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: wheelView.frame.width)
        
        let heightConstraint = NSLayoutConstraint(item: wheelView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: wheelView.frame.height)
        
        view.addConstraint(horizontalConstraint)
        view.addConstraint(verticalConstraint)
        view.addConstraint(widthConstraint)
        view.addConstraint(heightConstraint)
        
    }
    
    
    func checkCoreLocationPermission() {
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
    
    
    func locationManager(manager: CLLocationManager, didUpdateToLocation newLocation: CLLocation, fromLocation oldLocation: CLLocation) {
        print("Location:", newLocation.coordinate.latitude, newLocation.coordinate.longitude)
        let pos = ["lat": newLocation.coordinate.latitude, "lon": newLocation.coordinate.longitude]
        
        self.socket.emit("playerUpdate", pos)
    }

}

