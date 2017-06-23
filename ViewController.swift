//
//  ViewController.swift
//  BezierPathTrial
//
//  Created by Nirmal on 2017-06-17.
//  Copyright © 2017 Nirmal. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var blueView: UIView!
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let width: CGFloat = 240.0
        let height: CGFloat = 160.0
        
        let demoView = CustomView(frame: CGRect(x: self.view.frame.size.width/2 - width/2,
                                              y: self.view.frame.size.height/2 - height/2,
                                              width: width,
                                              height: height))
        
        self.view.addSubview(demoView)
        
        
        self.blueView = UIView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        self.blueView.backgroundColor = UIColor.blue
        self.view.addSubview(blueView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func animateTapped(_ sender: UIButton) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x: 10, y: 10))
        path.addLine(to: CGPoint(x: 200, y: 100))
        path.addCurve(to: CGPoint(x: self.view.frame.size.width - 50, y: self.view.frame.size.height - 50), controlPoint1: CGPoint(x: 50, y: 200), controlPoint2: CGPoint(x: 100, y: 300))
        
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        shape.strokeColor = UIColor.brown.cgColor
        shape.lineCap = kCALineJoinBevel
        shape.lineWidth = 2.0
        
        let anim = CAKeyframeAnimation(keyPath: "position")
        anim.path = path.cgPath
        anim.rotationMode = kCAAnimationRotateAuto
        anim.repeatCount = Float.infinity
        anim.duration = 5.0
        
        shape.add(anim, forKey: "position")
        
        self.blueView.layer.addSublayer(shape)
        
    }

}

