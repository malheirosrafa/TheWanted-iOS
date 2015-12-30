//
//  MapPlayerDamageView.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/28/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit

class MapPlayerDamageView: UILabel {

    convenience init()
    {
        self.init(frame: CGRectMake(0, 0, 200, 21))
        
        setupView()
    }
    
    
    func setupView()
    {
        self.textColor = UIColor.redColor()
        self.textAlignment = NSTextAlignment.Center
        self.layer.anchorPoint = CGPointMake(0.5, 1)
        self.layer.position = CGPointMake(0, 0)

        self.transform = CGAffineTransformMakeScale(0, 0)
        
        let animationOpts = UIViewAnimationOptions.CurveEaseOut
        let keyFrameOpts: UIViewKeyframeAnimationOptions = UIViewKeyframeAnimationOptions(rawValue: animationOpts.rawValue)
        
        UIView.animateKeyframesWithDuration(0.7, delay: 0, options: keyFrameOpts, animations: { () -> Void in
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 0.1, animations: { () -> Void in
                self.transform = CGAffineTransformMakeScale(1.3, 1.3)
            })
            
            UIView.addKeyframeWithRelativeStartTime(0.0, relativeDuration: 1.0, animations: { () -> Void in
                self.transform = CGAffineTransformMakeTranslation(0, -100)
            })
            
            
            UIView.addKeyframeWithRelativeStartTime(0.7, relativeDuration: 0.3, animations: { () -> Void in
                self.alpha = 0
            })
            
            }) { (finished) -> Void in
                
                self.removeFromSuperview()
        }
        
//        self.transform = CGAffineTransformMakeScale(1, 1)
    }

}