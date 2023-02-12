import UIKit

extension TimerView {
    final class ProgressView: UIView {

        func drawProgress(with percent: CGFloat) {
            layer.sublayers?.removeAll()
            
            let circleFrame = UIScreen.main.bounds.width - 110
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
            
            let barsFrame = circleFrame - 50
            let barRadius = barsFrame / 2
            
            let barsPath = UIBezierPath(arcCenter: center,
                                        radius: barRadius,
                                        startAngle: startAngle,
                                        endAngle: endAngle,
                                        clockwise: true)
            
            let barsLayer = CAShapeLayer()
            barsLayer.path = barsPath.cgPath
            barsLayer.fillColor = UIColor.clear.cgColor
            barsLayer.strokeColor = UIColor.clear.cgColor
            barsLayer.lineWidth = 6
            
            let startBarRadius = barRadius - 0.5 * barsLayer.lineWidth
            let endBarRadius = startBarRadius + barsLayer.lineWidth
            
            var angle: CGFloat = 7 / 6
            (1...9).forEach { _ in
                let barAngle = angle * CGFloat.pi
                let starBarPoint = CGPoint(x: cos(-barAngle) * startBarRadius + center.x,
                                           y: sin(-barAngle) * startBarRadius + center.y)
                let endBarPoin = CGPoint(x: cos(-barAngle) * endBarRadius + center.x,
                                         y: sin(-barAngle) * endBarRadius + center.y)
                let barPath = UIBezierPath()
                barPath.move(to: starBarPoint)
                barPath.addLine(to: endBarPoin)
                
                let barLayer = CAShapeLayer()
                barLayer.path = barPath.cgPath
                barLayer.fillColor = UIColor.clear.cgColor
                barLayer.strokeColor = angle >= (1.25 - 1.5 * percent) ? Res.Colors.active.cgColor : Res.Colors.separator.cgColor
                barLayer.lineCap = .round
                barLayer.lineWidth = 4
                
                barsLayer.addSublayer(barLayer)
                angle -= 1 / 6
            }
            
            layer.addSublayer(defaultCircleLayer)
            layer.addSublayer(circleLayer)
            layer.addSublayer(bigDotLayer)
            layer.addSublayer(dotLayer)
            layer.addSublayer(barsLayer)
        }
    }
}
