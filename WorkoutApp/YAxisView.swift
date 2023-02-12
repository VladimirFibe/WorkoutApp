import UIKit

final class YAxisView: WABaseView {
    private let stackView = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .equalSpacing
    }
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }

        (0...9).reversed().forEach {
            let label = UILabel()
            label.font = Res.Fonts.helveticaRegular(with: 9)
            label.textColor = Res.Colors.inActive
            label.textAlignment = .right
            label.text = "\($0 * 10)" // TODO: - Remake to colculated interval

            stackView.addArrangedSubview(label)
        }
    }
}

extension YAxisView {
    override func setupViews() {
        super.setupViews()
        addView(stackView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
