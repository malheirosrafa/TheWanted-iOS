//
//  MapView.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/22/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit

class MapView: UIView {
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        drawMap()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        drawMap()
    }

    func drawMap()
    {
        setupBackground()
    }
    
    func setupBackground()
    {
//        self.layer.backgroundColor = UIColor.orangeColor().CGColor
    }
    
    
    
    func addMarker(marker:UIView)
    {
        self.addSubview(marker)
    }
    
    
}