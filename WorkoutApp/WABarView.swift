import UIKit

extension WABarView {
    struct Data {
        let value: String
        let heightMultiplier: Double
        let title: String
    }
}

final class WABarView: WABaseView {
    
    private let heightMultiplier: Double
    
    private let valueLabel = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 13)
        $0.textColor = Res.Colors.active
        
    }
    private let titleLabel = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 9)
        $0.textColor = Res.Colors.inActive
    }
    
    private let barView = UIView().then {
        $0.backgroundColor = Res.Colors.active
        $0.layer.cornerRadius = 2.5
    }
    
    init(data: Data) {
        self.heightMultiplier = data.heightMultiplier
        super.init(frame: .zero)
        valueLabel.text = data.value
        titleLabel.text = data.title.uppercased()
    }
    
    required init?(coder: NSCoder) {
        self.heightMultiplier = 0
        super.init(frame: .zero)
    }
}

extension WABarView {
    override func setupViews() {
        super.setupViews()
        addView(valueLabel)
        addView(titleLabel)
        addView(barView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            barView.topAnchor.constraint(equalTo: valueLabel.bottomAnchor, constant: 5),
            barView.centerXAnchor.constraint(equalTo: centerXAnchor),
            barView.widthAnchor.constraint(equalToConstant: 17),
            barView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: heightMultiplier, constant: -40),
            
            titleLabel.topAnchor.constraint(equalTo: barView.bottomAnchor, constant: 10),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()

    }
}
