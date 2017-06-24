//
//  CustomView.swift
//  BezierPathTrial
//
//  Created by Nirmal on 2017-06-17.
//  Copyright © 2017 Nirmal. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    var rectanglePath: UIBezierPath!
    var trianglePath: UIBezierPath!
    var ovalPath: UIBezierPath!
    var arcPath: UIBezierPath!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
        
        self.createShapeLayer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func createShapeLayer() {
        self.createRectangle()
        
        let rectShapeLayer = CAShapeLayer()
        rectShapeLayer.path = self.rectanglePath.cgPath
        rectShapeLayer.fillColor = UIColor.clear.cgColor
        rectShapeLayer.strokeColor = UIColor.brown.cgColor
        rectShapeLayer.lineWidth = 2.0
        rectShapeLayer.strokeEnd = 0
        
        let anim = CABasicAnimation(keyPath: "strokeEnd")
        anim.repeatCount = Float.infinity
        anim.fillMode = kCAFillModeForwards
        anim.autoreverses = false
        anim.duration = 5.0
        anim.toValue = 1
        
        rectShapeLayer.add(anim, forKey: "strokeEnd")
        
        self.layer.addSublayer(rectShapeLayer)
    }
    
    override func draw(_ rect: CGRect) {
        self.createTriangle()
        UIColor.orange.setFill()
        self.trianglePath.fill()
        
        self.createOval()
        UIColor.purple.setFill()
        self.ovalPath.fill()
        
        self.createArc()
        UIColor.red.setFill()
        self.arcPath.fill()
    }
    
    func createRectangle() {
        //Rectangle Path
        self.rectanglePath = UIBezierPath()
        
        self.rectanglePath.move(to: CGPoint(x: 0, y: self.frame.size.height/2))
        self.rectanglePath.addLine(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2))
        self.rectanglePath.addLine(to: CGPoint(x: self.frame.size.width/2, y: 0))
        self.rectanglePath.addLine(to: CGPoint(x: 0, y: 0))
        
        self.rectanglePath.close()
    }
    
    func createTriangle() {
        //Triangle Path
        self.trianglePath = UIBezierPath()
        
        self.trianglePath.move(to: CGPoint(x: self.frame.size.width/4, y: self.frame.size.height/2))
        self.trianglePath.addLine(to: CGPoint(x: 0, y: self.frame.size.height))
        self.trianglePath.addLine(to: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height))
        
        self.trianglePath.close()
    }
    
    func createOval() {
        //Oval Path
        self.ovalPath = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2, y: 0, width: self.frame.size.width/2, height: self.frame.size.height/2))
    }
    
    func createArc() {
        //Arc Path
        self.arcPath = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width * 3/4, y: self.frame.size.height * 3/4), radius: self.frame.size.width/6, startAngle: CGFloat(270).toRadians(), endAngle: CGFloat(90).toRadians(), clockwise: false)
    }
}

extension CGFloat {
    func toRadians() -> CGFloat {
        return self * CGFloat(Double.pi) / 180.0
    }
}
