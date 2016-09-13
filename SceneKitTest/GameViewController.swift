//
//  GameViewController.swift
//  SceneKitTest
//
//  Created by Byhkalo Konstantyn on 9/13/16.
//  Copyright (c) 2016 Anadea. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit

class GameViewController: UIViewController {

    var scnView: SCNView!
    var scnScene: SCNScene!
    
    var cameraNode: SCNNode!
    var firstBox: SCNNode!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        setupScene()
        createBox()
        setupCamera()
        setupLight()
    }
    
    func setupView() {
        scnView = view as! SCNView
    }
    
    func setupScene() {
        scnScene = SCNScene()
        scnView.scene = scnScene
        
        scnView.showsStatistics = true //показывание статистики
        scnView.allowsCameraControl = true //поддержка движения жестов для контроля камеры
        scnView.autoenablesDefaultLighting = true //универсальный все заполняющий источник света
        
    }
    
    func setupCamera() {
        cameraNode = SCNNode()
        cameraNode.camera = SCNCamera()
        cameraNode.camera?.usesOrthographicProjection = true
        cameraNode.camera?.orthographicScale = 3
        cameraNode.position = SCNVector3Make(20, 20, 20)
        cameraNode.eulerAngles = SCNVector3Make(-45, 45, 0)
        let constraint = SCNLookAtConstraint(target: firstBox)
        constraint.gimbalLockEnabled = true
        cameraNode.constraints = [constraint]
        scnScene.rootNode.addChildNode(cameraNode)
    }
    
    func createBox() {
        firstBox = SCNNode()
        let firstBoxGeometry = SCNBox(width: 1, height: 1.5, length: 1, chamferRadius: 0)
        firstBox.geometry = firstBoxGeometry
        firstBox.position = SCNVector3Make(0, 0, 0)
        scnScene.rootNode.addChildNode(firstBox)
    }
    
    func setupLight() {
        let light = SCNNode()
        light.light = SCNLight()
        light.light?.type = SCNLightTypeDirectional
        light.eulerAngles = SCNVector3Make(-45, 45, 0)
        scnScene.rootNode.addChildNode(light)
    
        let light2 = SCNNode()
        light2.light = SCNLight()
        light2.light?.type = SCNLightTypeDirectional
        light2.eulerAngles = SCNVector3Make(45, 45, 0)
        scnScene.rootNode.addChildNode(light2)
    }
    
}
