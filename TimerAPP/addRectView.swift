//
//  addRectView.swift
//  TimerAPP
//
//  Created by Mohamed El Naggar on 5/23/17.
//  Copyright © 2017 Mohamed El Naggar. All rights reserved.
//

import UIKit

@IBDesignable

class addRectView: UIView {
    
    @IBInspectable var rectColor: UIColor = UIColor.green
    
    private func pathForDrawRect() -> UIBezierPath {
        let rectDraw = CGRect(x: self.bounds.minX + 2.0, y: self.bounds.minY + 2.0, width: self.bounds.maxX - 2.0, height: self.bounds.maxY - 2.0)
        let path = UIBezierPath(rect: rectDraw)
        
        UIColor.init(cgColor: rectColor.cgColor).set()
        
        path.lineWidth = 2.0
        return path
    }
    
    override func draw(_ rect: CGRect) {
        
        pathForDrawRect().stroke()
        
    }
}
