import UIKit

enum NavBarPosition {
    case left
    case right
}
class BaseController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        layoutViews()
        configureViews()
    }
}

@objc extension BaseController {
    func addViews() {}
    func layoutViews() {}
    func configureViews() {
        view.backgroundColor = Resources.Colors.background
    }
    func navBarLeftButtonHandler() {}
    func navBarRightButtonHandler() {}
}

extension BaseController {
    func addNavBarButton(at position: NavBarPosition, with title: String) {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(Resources.Colors.active, for: .normal)
        button.setTitleColor(Resources.Colors.inActive, for: .disabled)
        button.titleLabel?.font = Resources.Fonts.helveticaRegular(with: 17)
        
        switch position {
        case .left:
            button.addTarget(self, action: #selector(navBarLeftButtonHandler), for: .primaryActionTriggered)
            navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        case .right:
            button.addTarget(self, action: #selector(navBarRightButtonHandler), for: .primaryActionTriggered)
            navigationItem.rightBarButtonItem = UIBarButtonItem(customView: button)
        }
    }
}
