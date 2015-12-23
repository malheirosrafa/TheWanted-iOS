//
//  PlayerMarkerView.swift
//  TheWanted-iOS
//
//  Created by Rafael Malheiros on 04/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit

class TWPlayerMarkerView: UIView, TWMovable {

    let bgColor:UIColor = UIColor.init(red: 0.15, green: 0.34, blue: 0.20, alpha: 1.0)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupView()
    }
    
    func setupView()
    {
        self.backgroundColor = UIColor.clearColor()
        
        self.frame = CGRect(x: 100, y: 100, width: 20, height: 20)
        
        let singleFingerTap = UITapGestureRecognizer(target: self, action: "onTap:")

        addGestureRecognizer(singleFingerTap)
        
    }
    
    
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
    
    func onTap(gestureRecognizer: UIGestureRecognizer) {
        print("tap")
        moveTo(CGPoint(x: 10, y: 100))
    }
    
    
    func moveTo(position: CGPoint) {
        self.layer.position = position
    }
    

}
