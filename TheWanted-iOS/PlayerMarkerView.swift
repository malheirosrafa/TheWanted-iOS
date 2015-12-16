//
//  PlayerMarkerView.swift
//  TheWanted-iOS
//
//  Created by Rafael Malheiros on 04/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit

@IBDesignable
class PlayerMarkerView: UIView {

    let bgColor:UIColor = UIColor.init(red: 0.15, green: 0.34, blue: 0.20, alpha: 1.0)
    
    override func drawRect(rect: CGRect) {
        
        let viewWidth:Float = Float(self.frame.width)
        let viewHeight:Float = Float(self.frame.height)
        
        let circleDiameter = viewWidth
        let circleY = viewHeight / 2 - circleDiameter / 2
        let circleRect:CGRect = CGRectMake(0, CGFloat(circleY), CGFloat(circleDiameter), CGFloat(circleDiameter))
        let circle = UIBezierPath(ovalInRect: circleRect)
        
        bgColor.setFill()
        
        circle.fill()
        
    }

}
