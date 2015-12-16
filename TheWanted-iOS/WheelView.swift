//
//  WhellView.swift
//  TheWanted-iOS
//
//  Created by Rafael Malheiros on 05/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit
import Darwin

@IBDesignable
class WheelView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        drawButtons()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        drawButtons()
    }
    
    
    func drawButtons() {
    
        var buttons:[WheelActionButton] = [WheelActionButton]()
        
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        buttons.append(WheelActionButton(frame: CGRect(x: 0, y: 0, width: 60, height: 60)))
        
        var angle:CGFloat = 0
        let step:CGFloat  = CGFloat(2 * M_PI) / CGFloat(buttons.count)
        
        for(var i = 0; i < buttons.count; i++) {
            
            let x:CGFloat = frame.width / 1.5
            let y:CGFloat = frame.height / 1.5
            
            buttons[i].frame.origin.x = x / 2 + x * cos(angle);
            buttons[i].frame.origin.y = y / 2 + y * sin(angle);
            
            angle += step;
            
            addSubview(buttons[i])
        }
        
        let mainButton = WheelActionButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        mainButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(mainButton)
        
        let horizontalConstraint = NSLayoutConstraint(item: mainButton, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterX, multiplier: 1, constant: 0)
        
        let verticalConstraint = NSLayoutConstraint(item: mainButton, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self, attribute: NSLayoutAttribute.CenterY, multiplier: 1, constant: 0)
        
        let widthConstraint = NSLayoutConstraint(item: mainButton, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: mainButton.frame.width)
        
        let heightConstraint = NSLayoutConstraint(item: mainButton, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.NotAnAttribute, multiplier: 1, constant: mainButton.frame.height)
        
        self.addConstraint(horizontalConstraint)
        self.addConstraint(verticalConstraint)
        self.addConstraint(widthConstraint)
        self.addConstraint(heightConstraint)
        
                print("ended")
        
        
        //        let button = UIButton(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        //        button.backgroundColor = UIColor.redColor()
        //        addSubview(button)
    
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        print("toque")
        
//        let touchPoint:CGPoint = touches.first!.locationInView(self)
//        
//        let dx:CGFloat = touchPoint.x - self.center.x
//        let dy:CGFloat = touchPoint.y - self.center.y
//        
//        let deltaAngle = atan2(dx, dy);
//        
//        let startTransform = self.transform
        
        
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("ended")
    }
    
    override func touchesCancelled(touches: Set<UITouch>?, withEvent event: UIEvent?) {
        print("canceled")
    }
    
    

}