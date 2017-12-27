//
//  WTProgressView.swift
//  WTProgressViewDemo
//
//  Created by Wasi Tariq on 27/12/2017.
//  Copyright © 2017 Wasi Tariq. All rights reserved.
//

import UIKit

class WTProgressView: UIView , CAAnimationDelegate {

    var fillColor : UIColor?
    var animated = false
    var hasIndicatorBar = false
    
    private var path = UIBezierPath()
    
    private var value : CGFloat?
   
    private var fillLayer : CAShapeLayer?
    private var barLayer : CAShapeLayer?
    
    init(frame : CGRect, fillColor : UIColor , value : CGFloat , hasIndicatorBar : Bool)
    {
        super.init(frame: frame)
        self.fillColor = fillColor
        self.value = value
        self.hasIndicatorBar = hasIndicatorBar
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        super.draw(rect)
        path.move(to: CGPoint(x: 0, y: 3))
        path.addLine(to: CGPoint(x: getPercentValue(), y: 3))
        
        drawShapeLayer()
    }
    
    func fillTo(value : CGFloat)
    {
        self.value = value
        
        self.layer.sublayers = []
        
        path.move(to: CGPoint(x: 0, y: 3))
        path.addLine(to: CGPoint(x: getPercentValue(), y: self.frame.height - 3))
        
        drawShapeLayer()
    }
    
    func animateTo(value : CGFloat , duration : CGFloat)
    {
        self.value = value
        drawShapeLayer()
        
        fillLayer?.strokeEnd = 0
        animate(duration: duration)
    }
    
    private func drawShapeLayer()
    {
        if fillLayer != nil
        {
            fillLayer?.removeFromSuperlayer()
        }
        
        fillLayer = CAShapeLayer()
        fillLayer?.path = path.cgPath
        fillLayer?.strokeColor = self.fillColor?.cgColor
        fillLayer?.lineWidth = self.frame.height - 6
        fillLayer?.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(fillLayer!)
        
        if hasIndicatorBar
        {
            drawBar()
        }
     
        
        setNeedsDisplay()
    }
    
    private func getPercentValue() -> CGFloat
    {
        let fillValue = CGFloat(self.frame.width * self.value! / 100)
        
        return fillValue
    }
    
    private func drawBar()
    {
        path.move(to: CGPoint(x: getPercentValue(), y: -3))
        path.addLine(to: CGPoint(x: getPercentValue(), y: self.frame.height))
        
        barLayer = CAShapeLayer()
        barLayer!.path = path.cgPath
        barLayer!.strokeColor = self.fillColor?.cgColor
        barLayer!.lineWidth = 1
        barLayer!.fillColor = UIColor.clear.cgColor
        
        self.layer.addSublayer(barLayer!)
        
    }
    
    private func animate(duration : CGFloat)
    {
        fillLayer?.strokeEnd = 0
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.duration = CFTimeInterval(duration)
        animation.toValue = 1
        animation.fillMode = kCAFillModeForwards
        animation.isRemovedOnCompletion = false
        animation.delegate = self
        
        fillLayer?.add(animation, forKey: "animation")
        
    }
   
    
    //MARK: - CAAnimation delegate methods
    
    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
    
        if flag
        {
            drawBar()
        }
    }
    
}
