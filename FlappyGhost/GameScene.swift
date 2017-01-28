//
//  GameScene.swift
//  FlappyGhost
//
//  Created by Madhur Toppo on 1/27/17.
//  Copyright © 2017 Madhur Toppo. All rights reserved.
//

import SpriteKit
import GameplayKit

struct PhysicsCategory {
    static let Ghost:UInt32 = 0x1 << 1
    static let Ground:UInt32 = 0x1 << 1
    static let Wall:UInt32 = 0x1 << 1
}

class GameScene: SKScene {
    
    var Ground = SKSpriteNode()
    var Ghost = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        //Setup your scene here
        
        Ground = SKSpriteNode(imageNamed: "Ground")
        Ground.setScale(0.5)
        Ground.position = CGPoint(x: 0, y: -self.frame.height / 2 + Ground.frame.height / 2)
        
        Ground.physicsBody = SKPhysicsBody(rectangleOf: Ground.size)
        Ground.physicsBody?.categoryBitMask = PhysicsCategory.Ground
        Ground.physicsBody?.collisionBitMask = PhysicsCategory.Ghost
        Ground.physicsBody?.contactTestBitMask = PhysicsCategory.Ghost
        Ground.physicsBody?.affectedByGravity = false
        Ground.physicsBody?.isDynamic = false
        
        
        self.addChild(Ground)
        
        
        Ghost = SKSpriteNode(imageNamed: "Ghost")
        Ghost.size = CGSize(width: 60, height: 70)
        Ghost.position = CGPoint(x: -Ghost.frame.width, y: 0)
        
        Ghost.physicsBody = SKPhysicsBody(circleOfRadius: Ghost.frame.height / 2)
        Ghost.physicsBody?.categoryBitMask = PhysicsCategory.Ghost
        Ghost.physicsBody?.collisionBitMask = PhysicsCategory.Ground | PhysicsCategory.Wall
        Ghost.physicsBody?.contactTestBitMask = PhysicsCategory.Ground | PhysicsCategory.Wall
        Ghost.physicsBody?.affectedByGravity = true
        Ghost.physicsBody?.isDynamic = true
        
        self.addChild(Ghost)
        
        createWalls()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        Ghost.physicsBody?.velocity = CGVector(dx: 0, dy: 0)
        Ghost.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 60))
    }
    
    func createWalls() {
        let wallPair = SKNode()
        
        let topWall = SKSpriteNode(imageNamed: "Wall")
        let bottomWall = SKSpriteNode(imageNamed: "Wall")
        
        topWall.setScale(0.5)
        bottomWall.setScale(0.5)
        
        topWall.position = CGPoint(x: 0, y: 0 + 400)
        bottomWall.position = CGPoint(x: 0, y: 0 - 400)
        
        wallPair.addChild(topWall)
        wallPair.addChild(bottomWall)
        
        self.addChild(wallPair)
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
