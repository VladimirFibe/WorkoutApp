import UIKit

enum NavBarPosition {
    case left
    case right
}
class WABaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        layoutViews()
        configureAppearance()
    }
}

@objc extension WABaseController {
    func setupViews() {}
    func layoutViews() {}
    func configureAppearance() {
        view.backgroundColor = Res.Colors.background
    }
    func navBarLeftButtonHandler() {}
    func navBarRightButtonHandler() {}
}

extension WABaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Res.Colors.active, for: .normal)
        button.setTitleColor(Res.Colors.inActive, for: .disabled)
        button.titleLabel?.font = Res.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .primaryActionTriggered)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .primaryActionTriggered)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
    
    func setTitleForNavBarButton(_ title: String, at position: NavBarPosition) {
        switch position {
        case .left:
            (navigationItem.leftBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        case .right:
            (navigationItem.rightBarButtonItem?.customView as? UIButton)?.setTitle(title, for: .normal)
        }
        view.layoutIfNeeded()
    }
}
