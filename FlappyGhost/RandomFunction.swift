//
//  RandomFunction.swift
//  FlappyGhost
//
//  Created by Madhur Toppo on 1/30/17.
//  Copyright © 2017 Madhur Toppo. All rights reserved.
//

import Foundation
import CoreGraphics

public extension CGFloat {
    
    public static func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    public static func random(min : CGFloat, max : CGFloat) -> CGFloat {
        return CGFloat.random() * (max - min) + min
    }
}
