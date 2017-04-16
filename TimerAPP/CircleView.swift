//
//  CircleView.swift
//  TimerAPP
//
//  Created by Mohamed El Naggar on 4/16/17.
//  Copyright © 2017 Mohamed El Naggar. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {
    
    @IBInspectable var scale: CGFloat = 0.9
    @IBInspectable var circleLineWidth: CGFloat = 2.0
    @IBInspectable var circleColor: UIColor = UIColor.green
    
    private var circleRadius: CGFloat {
        get {
            return min(bounds.size.height , bounds.size.width) / 2.0 * scale
        }
    }
    
    private var circleCenter: CGPoint {
        get {
            return CGPoint(x: bounds.midX, y: bounds.midY)
        }
    }
    
    private func getPathForCircleAtPoint(midPoint: CGPoint , withRadius radius: CGFloat) -> UIBezierPath {
        let path = UIBezierPath(arcCenter: midPoint, radius: radius, startAngle: 0.0, endAngle: CGFloat(2 * Double.pi), clockwise: true)
        
        path.lineWidth = circleLineWidth
        
        circleColor.set()
        
        return path
    }

    override func draw(_ rect: CGRect) {
        getPathForCircleAtPoint(midPoint: circleCenter, withRadius: circleRadius).stroke()
        getPathForCircleAtPoint(midPoint: circleCenter, withRadius: circleRadius - 5.0).stroke()
    }

}
