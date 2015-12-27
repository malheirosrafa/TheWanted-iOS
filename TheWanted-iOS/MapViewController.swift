//
//  MapViewController.swift
//  TheWanted-iOS
//
//  Created by rafael on 04/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit

import CocoaLumberjack

class MapViewController: UIViewController {

    
    let distanceMultiplyer = 1000000.0
    
    let wheelView = WheelView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    let mapView = MapView()
    
    var localPlayer: TWLocalPlayer?
    
    var remotePlayerIdToMarkersDict = [String : MapPlayerMarkerView]()
    
    
    let notificationCenter = NSNotificationCenter.defaultCenter()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLocalPlayer()
        setupMapView()
        setupWheelView()
        
        notificationCenter.addObserver(self, selector: "onLocalPlayerConnect:", name: TWLocalPlayerNotification.Connect, object: nil)
        notificationCenter.addObserver(self, selector: "onLocalPlayerMove:", name: TWLocalPlayerNotification.Move, object: nil)
        
        notificationCenter.addObserver(self, selector: "onRemotePlayerEnter:", name: TWRemotePlayerNotification.Enter, object: nil)
//        notificationCenter.addObserver(self, selector: "onRemotePlayerLeave:", name: TWRemotePlayerNotification.Leave, object: nil)
        notificationCenter.addObserver(self, selector: "onRemotePlayerMove:", name: TWRemotePlayerNotification.Move, object: nil)
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        
        //TODO: Tirar essa porra daqui
        localPlayer?.stopUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    func setupMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        
        let topConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        let rightConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        let leftConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        view.addConstraint(topConstraint)
        view.addConstraint(rightConstraint)
        view.addConstraint(bottomConstraint)
        view.addConstraint(leftConstraint)
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
    
    
    
    func setupLocalPlayer()
    {
        self.localPlayer = TWLocalPlayerManager.sharedInstance.player
        let marker = MapPlayerMarkerView()
        mapView.addSubview(marker)
    }
    
    
    @objc func onLocalPlayerConnect(notification: NSNotification)
    {
        if self.localPlayer == nil {
            setupLocalPlayer()
        }
    }
    
    
    
    @objc func onRemotePlayerEnter(notification: NSNotification)
    {
        DDLogVerbose("MapViewController.onRemotePlayerEnter()")
        
        let remotePlayer = notification.object as! TWRemotePlayer
        let marker = MapPlayerMarkerView()
        marker.playerId = remotePlayer.id
        remotePlayerIdToMarkersDict[remotePlayer.id] = marker
        
        mapView.addSubview(marker)
        
        let singleFingerTap = UITapGestureRecognizer(target: self, action: "onTapMarker:")
        marker.userInteractionEnabled = true
        marker.addGestureRecognizer(singleFingerTap)
    }
    
    
    @objc func onLocalPlayerMove(notification: NSNotification)
    {
        DDLogVerbose("MapViewController.onLocalPlayerMove()")
        
        let remotePlayers = TWRemotePlayerManager.sharedInstance.players
        
        
        let localLat = self.localPlayer!.position!.lat
        let localLon = self.localPlayer!.position!.lon
        
        for (remotePlayerId, remotePlayer) in remotePlayers {
            
            let remoteLat = remotePlayer.position!.lat
            let remoteLon = remotePlayer.position!.lon
            
            let relativeLat = remoteLat - localLat
            let relativeLon = remoteLon - localLon
            
            let newX = relativeLon * distanceMultiplyer
            let newY = -(relativeLat * distanceMultiplyer)
            
            let marker = remotePlayerIdToMarkersDict[remotePlayerId]
            marker!.layer.position = CGPoint(x: newX, y: newY)
        }
    }
    
    
    @objc func onRemotePlayerMove(notification: NSNotification)
    {
        DDLogVerbose("MapViewController.onRemotePlayerMove()")
        
        let remotePlayer = notification.object as! TWRemotePlayer
        
        let remoteLat = remotePlayer.position!.lat
        let remoteLon = remotePlayer.position!.lon
        
        let localLat = self.localPlayer!.position!.lat
        let localLon = self.localPlayer!.position!.lon
        
        let relativeLat = remoteLat - localLat
        let relativeLon = remoteLon - localLon
        
        let newX = relativeLon * distanceMultiplyer
        let newY = -(relativeLat * distanceMultiplyer)
        
        let marker = remotePlayerIdToMarkersDict[remotePlayer.id]
        marker!.layer.position = CGPoint(x: newX, y: newY)
    }
    
    
    func onTapMarker(gestureRecognizer: UIGestureRecognizer) {
        DDLogVerbose("MapViewController.onTapMarker()")
        let marker = gestureRecognizer.view as! MapPlayerMarkerView
    }

}

