//
//  GameScene.swift
//  SpriteKit_balls_example
//
//  Created by Eugene Bagaev on 22.12.2019.
//  Copyright © 2019 Eugene Bagaev. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
  
    func createBall() {
     
        
        let src = [
             
                 vector_float2(0.0, 0.0),
                 vector_float2(0.5, 0.0),
                 vector_float2(1.0, 0.0),
                 
                 vector_float2(0.0, 0.5),
                 vector_float2(0.5, 0.5),
                 vector_float2(1.0, 0.5),
                 
                 vector_float2(0.0, 1.0),
                 vector_float2(0.5, 1.0),
                 vector_float2(1.0, 1.0),
             ]
             
          let warpGeometryGridNoWarp = SKWarpGeometryGrid(columns: 2, rows: 2, sourcePositions: src, destinationPositions: src)
             
          var dst = src
          
        
          let delta = Float.random(in: 0...1)
        
          dst[0] = vector_float2(0,-0.5)
          dst[2] = vector_float2(delta,-0.5)
             
          let warpGeometryGrid = SKWarpGeometryGrid(columns: 2, rows: 2, sourcePositions: src, destinationPositions: dst)
            
        
        
          let ball = SKSpriteNode(imageNamed: "snowflake")
          
          ball.position = CGPoint(x: CGFloat(Int(arc4random())  & Int(size.width)), y: size.height - ball.size.height)
          
          ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.size.width/2)
          
        if Bool.random() {
        
          ball.warpGeometry = warpGeometryGridNoWarp
        
           let warpAction = SKAction.animate(withWarps:
            [
            warpGeometryGridNoWarp,
            warpGeometryGrid
            ],
            times: [0.2, 0.5])
        
          ball.run(warpAction!)
        }
        
          addChild(ball)
    
    }
    
    
    
    
    
    override func didMove(to view: SKView) {
        
        
        backgroundColor = UIColor.white
        
        scene!.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        
        
        run(
            
            SKAction.repeat(
                
                    SKAction.sequence(
                       [
                          SKAction.run(createBall),
                                               
                          SKAction.wait(forDuration: 0.15),
                    
                        ]
                
                     )
                    ,
                    count: 200
                                    
            )
        )
        
      }
       
        
        
        /* Get label node from scene and store it for use later
        self.label = self.childNode(withName: "//helloLabel") as? SKLabelNode
        if let label = self.label {
            label.alpha = 0.0
            label.run(SKAction.fadeIn(withDuration: 2.0))
        }
       
        // Create shape node to use during mouse interaction
        let w = (self.size.width + self.size.height) * 0.05
        self.spinnyNode = SKShapeNode.init(rectOf: CGSize.init(width: w, height: w), cornerRadius: w * 0.3)
        
        if let spinnyNode = self.spinnyNode {
            spinnyNode.lineWidth = 2.5
            
            spinnyNode.run(SKAction.repeatForever(SKAction.rotate(byAngle: CGFloat(Double.pi), duration: 1)))
            spinnyNode.run(SKAction.sequence([SKAction.wait(forDuration: 0.5),
                                              SKAction.fadeOut(withDuration: 0.5),
                                              SKAction.removeFromParent()]))
        }
    
         
    }
    
  
    

    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let label = self.label {
            label.run(SKAction.init(named: "Pulse")!, withKey: "fadeInOut")
        }
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
*/

 }
