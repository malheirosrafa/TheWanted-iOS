//
//  MapViewController.swift
//  TheWanted-iOS
//
//  Created by rafael on 04/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit


class MapViewController: UIViewController {

    
    let wheelView = WheelView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    
    let mapView = MapView()
    
    let locationManager = TWLocationManager.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.startUpdatingLocation()
        
        setupMapView()
        setupWheelView()
    }
    
    override func viewWillDisappear(animated: Bool) {
        locationManager.stopUpdatingLocation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    func setupMapView() {
        mapView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(mapView)
        
        let topConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        
        let rightConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Right, multiplier: 1, constant: 0)
        
        let bottomConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        
        let leftConstraint = NSLayoutConstraint(item: mapView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: view, attribute: NSLayoutAttribute.Left, multiplier: 1, constant: 0)
        
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

}

