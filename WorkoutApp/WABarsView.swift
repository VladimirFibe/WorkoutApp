import UIKit

final class WABarsView: WABaseView {
    private let stack = UIStackView().then {
        $0.distribution = .fillEqually
    }
    
    func configure(with data: [WABarView.Data]) {
        data.forEach {
            let barView = WABarView(data: $0)
            stack.addArrangedSubview(barView)
        }
    }
}

extension WABarsView {
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
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
