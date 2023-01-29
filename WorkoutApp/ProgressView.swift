//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by Vladimir Fibe on 1/29/23.
//

import UIKit

extension TimerView {
    final class ProgressView: UIView {
        var circleFrame: CGFloat {
            print("DEBUG: \(frame.width)")
            return frame.width == 0 ? UIScreen.main.bounds.width - 110 : frame.width
        }
        func drawProgress(with percent: CGFloat) {
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -1.25 * CGFloat.pi
            let endAngle = 0.25 * CGFloat.pi
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let defaultCircleLayer = CAShapeLayer()
            defaultCircleLayer.path = circlePath.cgPath
            defaultCircleLayer.strokeColor = Res.Colors.separator.cgColor
            defaultCircleLayer.lineWidth = 20
            defaultCircleLayer.strokeEnd = 1
            defaultCircleLayer.fillColor = UIColor.clear.cgColor
            defaultCircleLayer.lineCap = .round
            
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = Res.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            let dotAngle = (1.25 - 1.5 * percent) * CGFloat.pi
            let dotPoint = CGPoint(x: cos(-dotAngle) * radius + center.x,
                                   y: sin(-dotAngle) * radius + center.y)
            
            let dotPath = UIBezierPath()
            dotPath.move(to: dotPoint)
            dotPath.addLine(to: dotPoint)
            
            let bigDotLayer = CAShapeLayer()
            bigDotLayer.path = dotPath.cgPath
            bigDotLayer.fillColor = UIColor.clear.cgColor
            bigDotLayer.strokeColor = Res.Colors.active.cgColor
            bigDotLayer.lineCap = .round
            bigDotLayer.lineWidth = 20
            
            let dotLayer = CAShapeLayer()
            dotLayer.path = dotPath.cgPath
            dotLayer.fillColor = UIColor.clear.cgColor
            dotLayer.strokeColor = UIColor.white.cgColor
            dotLayer.lineCap = .round
            dotLayer.lineWidth = 8
            
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
        }
    }
}
