//
//  WhellActionButton.swift
//  TheWanted-iOS
//
//  Created by Rafael Malheiros on 05/12/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit
import Foundation
import QuartzCore

class WheelActionButton : UIButton {
    
    
    // Mark: Properties
    
    
    // Mark: Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    
    func setupButton() {
        self.layer.borderWidth  = 1
        self.layer.cornerRadius = frame.width / 2;
        self.layer.borderColor  = UIColor.grayColor().CGColor
        self.backgroundColor    = UIColor.greenColor()
        self.tintColor          = UIColor.whiteColor()
    }
    
}
