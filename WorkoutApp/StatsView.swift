import UIKit

final class StatsView: WABaseInfoView {
    lazy var stack = UIStackView().then {
        $0.axis = .vertical
        $0.distribution = .fillEqually
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
            stack.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 1)
        ])
    }
    
    override func configureViews() {
        backgroundColor = .red
        super.configureViews()
        for _ in 0..<4 {
            let view = StatItemView()
            view.configure(with: Res.Strings.Session.heartRate, value: "155 bpm", image: Res.Images.Session.Stats.heartRate)
            stack.addArrangedSubview(view)
        }
    }
}
