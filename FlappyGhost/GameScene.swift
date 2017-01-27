//
//  GameScene.swift
//  FlappyGhost
//
//  Created by Madhur Toppo on 1/27/17.
//  Copyright © 2017 Madhur Toppo. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    var Ground = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.setScale(0.5)
        Ground.position = CGPoint(x: 0, y: -self.frame.height / 2 + Ground.frame.height / 2)
        self.addChild(Ground)
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
