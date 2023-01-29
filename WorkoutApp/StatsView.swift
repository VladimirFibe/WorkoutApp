import UIKit

final class StatsView: WABaseInfoView {
    lazy var stack = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
        $0.spacing = 15
    }
    
    func configure(with items: [StatsItem]) {
        items.forEach {
            let view = StatItemView()
            view.configure(with: $0)
            stack.addArrangedSubview(view)
        }
    }
}

extension StatsView {
    override func setupViews() {
        super.setupViews()
        addView(stack)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 1)
        ])
    }
    
    override func configureAppearance() {
        backgroundColor = .red
        super.configureAppearance()

    }
}
