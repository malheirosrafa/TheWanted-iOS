//
//  ActionableProtocol.swift
//  TheWanted-iOS
//
//  Created by rafael malheiros on 12/23/15.
//  Copyright © 2015 playr2. All rights reserved.
//

protocol TWActionable
{
    var actionList:[TWAction] { get set }
    var marker:TWMovable { get set }
}
