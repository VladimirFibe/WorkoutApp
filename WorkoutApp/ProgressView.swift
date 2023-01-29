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
            frame.width == 0 ? UIScreen.main.bounds.width - 110 : frame.width
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
            let circleLayer = CAShapeLayer()
            circleLayer.path = circlePath.cgPath
            circleLayer.strokeColor = Res.Colors.active.cgColor
            circleLayer.lineWidth = 20
            circleLayer.strokeEnd = percent
            circleLayer.fillColor = UIColor.clear.cgColor
            circleLayer.lineCap = .round
            
            layer.addSublayer(circleLayer)
        }
    }
}
