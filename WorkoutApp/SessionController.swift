import UIKit

final class SessionController: BaseController {
    private let timerView = BaseInfoView(with: "One", buttonTitle: "Two")
    
    @objc func buttonTapped() {}
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        view.addView(timerView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            timerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: timerView.trailingAnchor, multiplier: 2),
            timerView.heightAnchor.constraint(equalToConstant: 300)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        title = Res.Strings.NavBar.session
        timerView.addButtonTarget(self, action: #selector(buttonTapped))
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
    }
}
