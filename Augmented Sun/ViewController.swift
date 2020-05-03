//
//  ViewController.swift
//  Augmented Dice
//
//  Created by Giorgi Jashiashvili on 5/3/20.
//  Copyright © 2020 Giorgi Jashiashvili. All rights reserved.
//

import UIKit
import SceneKit
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the view's delegate
        sceneView.delegate = self
        
        let sphere = SCNSphere(radius: 0.5)
    
        let material = SCNMaterial()
        material.diffuse.contents = UIImage(named: "art.scnassets/8k_sun.jpg")
        sphere.materials = [material]
        
        let node = SCNNode()
        node.position = SCNVector3(0, 0.1, -1)
        node.geometry = sphere
        
        sceneView.scene.rootNode.addChildNode(node)
        sceneView.autoenablesDefaultLighting = true
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create a session configuration
        let configuration = ARWorldTrackingConfiguration()

        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

}
