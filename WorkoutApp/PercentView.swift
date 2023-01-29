import UIKit

extension TimerView {
    final class PercentView: WABaseView {
        let valueLabel = UILabel().then {
            $0.font = Res.Fonts.helveticaRegular(with: 23)
            $0.textColor = Res.Colors.titleGray
            $0.textAlignment = .center
        }
        let titleLabel = UILabel().then {
            $0.font = Res.Fonts.helveticaRegular(with: 10)
            $0.textColor = Res.Colors.inActive
            $0.textAlignment = .center
        }
        lazy var stack = UIStackView(arrangedSubviews: [valueLabel, titleLabel]).then {
            $0.axis = .vertical
            $0.alignment = .center
            $0.spacing = 5
        }
        
        func configure(with value: Int, and title: String) {
            valueLabel.text = "\(value)%"
            titleLabel.text = title.uppercased()
        }
    }
}

extension TimerView.PercentView {
    override func setupViews() {
        super.setupViews()
        addView(stack)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            bottomAnchor.constraint(equalTo: stack.bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
