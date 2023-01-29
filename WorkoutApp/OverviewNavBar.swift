import UIKit

final class OverviewNavBar: WABaseView {
    private let allWorkoutsButton = WAButton(with: .secondary).then {
        $0.setTitle(Res.Strings.Overview.allWorkoutsButton)
    }
    private let titleLabel = UILabel()
    private let addButton = UIButton()
    
    let weekView = WeekView()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addBottomBorder(with: Res.Colors.separator, height: 1)
    }
    
    func allWorkoutsButtonAction(_ target: Any?, action: Selector) {
        allWorkoutsButton.addTarget(target, action: action, for: .primaryActionTriggered)
    }
    
    func addButtonAction(_ target: Any?, action: Selector) {
        addButton.addTarget(target, action: action, for: .primaryActionTriggered)
    }
}

extension OverviewNavBar {
    override func setupViews() {
        super.setupViews()
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
            
            titleLabel.centerYAnchor.constraint(equalTo: addButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            allWorkoutsButton.leadingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 1),
            
            
            weekView.topAnchor.constraint(equalToSystemSpacingBelow: allWorkoutsButton.bottomAnchor, multiplier: 1),
            weekView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: weekView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: weekView.bottomAnchor, multiplier: 1),
            weekView.heightAnchor.constraint(equalToConstant: 47)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        backgroundColor = .white

        titleLabel.text = Res.Strings.NavBar.overview
        titleLabel.textColor = Res.Colors.titleGray
        titleLabel.font = Res.Fonts.helveticaRegular(with: 22)

        addButton.setImage(Res.Images.Common.addButton, for: .normal)
    }
}
