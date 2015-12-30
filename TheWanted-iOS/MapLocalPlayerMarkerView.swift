//
//  MapLocalPlayerMarkerView.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/28/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit


class MapLocalPlayerMarkerView: UIView{
    
    
    var hp:Int = 100
    
    let markerColor:UIColor = UIColor.init(red: 0.15, green: 0.34, blue: 0.90, alpha: 1.0)
    let hpGreenColor:UIColor = UIColor.init(red: 0, green: 1.0, blue: 0, alpha: 1.0)
    
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView()
    {
        self.backgroundColor = UIColor.clearColor()
        
        self.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        
        self.layer.anchorPoint = CGPointMake(0.5, 0.5);
        self.layer.position = CGPointMake(0.0, 0.0)
    }
    
    
    override func drawRect(rect: CGRect)
    {
        
        let viewWidth = CGFloat(self.frame.width)
        let viewHeight = CGFloat(self.frame.height)
        
        
        let hpLineWidth = CGFloat(4.0)
        
        
        let circleDiameter = viewWidth - hpLineWidth * 2
        let circleX = hpLineWidth
        let circleY = hpLineWidth
        let circleRect = CGRectMake(circleX, circleY, circleDiameter, circleDiameter)
        let marker = UIBezierPath(ovalInRect: circleRect)
        
        markerColor.setFill()
        
        marker.fill()
        
        let hpRadius = circleDiameter / 2 + hpLineWidth / 2
        let hpCenter = CGPoint(x: viewWidth / 2, y: viewHeight / 2)
        
        let hpStartAngle = CGFloat(-M_PI_2)
        
        let currentHp = Double(hp)
        let hpEndAngle = CGFloat( (((M_PI * 2) / 100.0) * currentHp) - M_PI_2)
        
        
        let hpPath = UIBezierPath()
        hpPath.addArcWithCenter(hpCenter, radius: hpRadius, startAngle: hpStartAngle, endAngle: hpEndAngle, clockwise: true)
        hpPath.lineWidth = hpLineWidth
        hpGreenColor.setStroke()
        hpPath.stroke()
        
    }
    
}