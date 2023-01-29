import UIKit

enum Tabs: Int, CaseIterable {
    case overview
    case session
    case progress
    case settings
}
final class TabBarController: UITabBarController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        configure()
        #warning("удалить!")
        switchTo(.session)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func switchTo(_ tab: Tabs) {
        selectedIndex = tab.rawValue
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func configure() {
        tabBar.tintColor = Res.Colors.active
        tabBar.barTintColor = Res.Colors.inActive
        tabBar.backgroundColor = .white
        tabBar.layer.borderColor = Res.Colors.separator.cgColor
        tabBar.layer.borderWidth = 1
        tabBar.layer.masksToBounds = true
                
        let controllers: [NavBarController] = Tabs.allCases.map {
            let controller = NavBarController(rootViewController: getController(for: $0))
            controller.tabBarItem = UITabBarItem(title: Res.Strings.TabBar.title(for: $0),
                                                 image: Res.Images.TabBar.icon(for: $0),
                                                 tag: $0.rawValue)
            return controller
        }
        setViewControllers(controllers, animated: false)
    }
    
    private func getController(for tab: Tabs) -> WABaseController {
        switch tab {
        case .overview: return OverviewController()
        case .session:  return SessionController()
        case .progress: return ProgressController()
        case .settings: return SettingsController()
        }
    }
}
