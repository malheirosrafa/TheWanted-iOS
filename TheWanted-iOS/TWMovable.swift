//
//  TWMovable.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/23/15.
//  Copyright © 2015 playr2. All rights reserved.
//

import UIKit

protocol TWMovable: TWNotificable
{
    func moveTo(position: CGPoint)
}
