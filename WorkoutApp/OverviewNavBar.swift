import UIKit

final class OverviewNavBar: BaseView {
    private let allWorkoutsButton = SecondaryButton()
    private let titleLabel = UILabel()
    private let addButton = UIButton()
    
    let weekView: UIView = {
        $0.backgroundColor = .blue.withAlphaComponent(0.2)
        return $0
    }(UIView())
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Resources.Colors.separator, height: 1)
    }
    func allWorkoutsButtonAction(_ target: Any?, action: Selector) {
        allWorkoutsButton.addTarget(target, action: action, for: .primaryActionTriggered)
    }
    
    func addButtonAction(_ target: Any?, action: Selector) {
        addButton.addTarget(target, action: action, for: .primaryActionTriggered)
    }
}

extension OverviewNavBar {
    override func addViews() {
        super.addViews()
        addView(allWorkoutsButton)
        addView(titleLabel)
        addView(addButton)
        addView(weekView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            
            addButton.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: addButton.trailingAnchor, multiplier: 2),
            addButton.heightAnchor.constraint(equalToConstant: 28),
            addButton.widthAnchor.constraint(equalToConstant: 28),
            
            allWorkoutsButton.topAnchor.constraint(equalTo: addButton.topAnchor),
            addButton.leadingAnchor.constraint(equalToSystemSpacingAfter: allWorkoutsButton.trailingAnchor, multiplier: 2),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130),
            
            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            allWorkoutsButton.leadingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1),
            
            weekView.topAnchor.constraint(equalToSystemSpacingBelow: allWorkoutsButton.bottomAnchor, multiplier: 1),
            weekView.leadingAnchor.constraint(equalTo: leadingAnchor),
            weekView.trailingAnchor.constraint(equalTo: trailingAnchor),
            weekView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            weekView.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    override func configure() {
        super.configure()
        backgroundColor = .white

        titleLabel.text = Resources.Strings.NavBar.overview
        titleLabel.textColor = Resources.Colors.titleGray
        titleLabel.font = Resources.Fonts.helveticaRegular(with: 22)

        addButton.setImage(Resources.Images.Common.addButton, for: .normal)
        
        allWorkoutsButton.setTitle(Resources.Strings.Overview.allWorkoutsButton)
        
    }
}
