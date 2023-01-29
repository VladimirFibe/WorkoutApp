import UIKit

final class StepsView: WABaseInfoView {
    private let barsView = WABarsView()
    func configure(with items: [WABarView.Data]) {
        barsView.configure(with: items)
    }
}

extension StepsView {
    override func setupViews() {
        super.setupViews()
        addView(barsView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalToSystemSpacingBelow: contentView.topAnchor, multiplier: 1),
            barsView.leadingAnchor.constraint(equalToSystemSpacingAfter: contentView.leadingAnchor, multiplier: 1),
            contentView.trailingAnchor.constraint(equalToSystemSpacingAfter: barsView.trailingAnchor, multiplier: 1),
            contentView.bottomAnchor.constraint(equalToSystemSpacingBelow: barsView.bottomAnchor, multiplier: 1)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
