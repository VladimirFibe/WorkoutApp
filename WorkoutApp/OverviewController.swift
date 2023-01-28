import UIKit

final class OverviewController: BaseController {
    private let allWorkoutsButton = SecondaryButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension OverviewController {
    override func addViews() {
        super.addViews()
        view.addSubview(allWorkoutsButton)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            allWorkoutsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            allWorkoutsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            allWorkoutsButton.heightAnchor.constraint(equalToConstant: 28),
            allWorkoutsButton.widthAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    override func configure() {
        super.configure()
        allWorkoutsButton.setTitle(Resources.Strings.Overview.allWorkoutsButton)
        allWorkoutsButton.addTarget(self, action: #selector(allWorkoutsButtonAction), for: .primaryActionTriggered)
    }
}

@objc extension OverviewController {
    func allWorkoutsButtonAction() {
        print("DEBUG: \(#function)")
    }
}
