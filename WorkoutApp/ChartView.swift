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
