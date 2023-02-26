import UIKit

final class XAxisView: WABaseView {
    private let stackView = UIStackView().then {
        $0.distribution = .fillEqually
    }
    
    func configure(with data: [WAChartsView.Data]) {
        stackView.arrangedSubviews.forEach {
            $0.removeFromSuperview()
        }
        
        data.forEach {
            let label = UILabel()
            label.font = Res.Fonts.helveticaRegular(with: 9)
            label.textColor = Res.Colors.inActive
            label.textAlignment = .center
            label.text = $0.title.uppercased()
            stackView.addArrangedSubview(label)
        }
    }
    
}

extension XAxisView {
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
