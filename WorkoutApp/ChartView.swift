import UIKit

final class ChartView: WABaseView {
    
    private let yAxisSeparator = UIView().then {
        $0.backgroundColor = Res.Colors.separator
    }
    
    private let xAxisSeparator = UIView().then {
        $0.backgroundColor = Res.Colors.separator
    }
    
    func configuration(with data: [WAChartsView.Data], topChartOffset: Int) {
        layoutIfNeeded()
        drawDashLines()
        drawChart(with: data, topChartOffset: topChartOffset)
    }
}

extension ChartView {
    override func setupViews() {
        super.setupViews()
        addView(xAxisSeparator)
        addView(yAxisSeparator)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            yAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            yAxisSeparator.topAnchor.constraint(equalTo: topAnchor),
            yAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            yAxisSeparator.widthAnchor.constraint(equalToConstant: 1),

            xAxisSeparator.leadingAnchor.constraint(equalTo: leadingAnchor),
            xAxisSeparator.trailingAnchor.constraint(equalTo: trailingAnchor),
            xAxisSeparator.bottomAnchor.constraint(equalTo: bottomAnchor),
            xAxisSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}

private extension ChartView {
    
    func drawDashLines(with counts: Int = 9) {
        (0..<counts).map { CGFloat($0) }.forEach {
            drawDashLine(at: $0 * bounds.height / CGFloat(counts))
        }
    }
    func drawDashLine(at yPosition: CGFloat) {
        let startPoint = CGPoint(x: 0, y: yPosition)
        let endPoint = CGPoint(x: bounds.width, y: yPosition)
        
        let dashPath = CGMutablePath()
        dashPath.addLines(between: [startPoint, endPoint])
        
        let dashLayer = CAShapeLayer()
        dashLayer.path = dashPath
        dashLayer.strokeColor = Res.Colors.separator.cgColor
        dashLayer.lineWidth = 1
        dashLayer.lineDashPattern = [6, 3]
        
        layer.addSublayer(dashLayer)
    }
    
    func drawChart(with data: [WAChartsView.Data], topChartOffset: Int) {
        guard let maxValue = data.sorted(by: {$0.value > $1.value}).first?.value else { return }
        let valuePoints = data.enumerated().map { CGPoint(x: CGFloat($0), y: CGFloat($1.value))}
        let chartHeight = bounds.height / CGFloat(maxValue + topChartOffset)
        let points = valuePoints.map {
            let x = $0.x * bounds.width / CGFloat(valuePoints.count - 1)
            let y = bounds.height - $0.y * chartHeight
            return CGPoint(x: x, y: y)
        }
        
        let chartPath = UIBezierPath()
        chartPath.move(to: points[0])
        points.forEach {
            chartPath.addLine(to: $0)
            drawChartDot(at: $0)
        }
        
        let chartLayer = CAShapeLayer()
        chartLayer.path = chartPath.cgPath
        chartLayer.fillColor = UIColor.clear.cgColor
        chartLayer.strokeColor = Res.Colors.active.cgColor
        chartLayer.lineWidth = 3
        chartLayer.strokeEnd = 1
        chartLayer.lineJoin = .round
        
        layer.addSublayer(chartLayer)
    }
    
    func drawChartDot(at point: CGPoint) {
        let dotPath = UIBezierPath()
        dotPath.move(to: point)
        dotPath.addLine(to: point)
        
        let dotLayer = CAShapeLayer()
        dotLayer.path = dotPath.cgPath
        dotLayer.strokeColor = Res.Colors.active.cgColor
        dotLayer.lineCap = .round
        dotLayer.lineWidth = 10
        
        layer.addSublayer(dotLayer)
    }
}
