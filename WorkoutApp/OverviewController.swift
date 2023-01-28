import UIKit

final class OverviewController: BaseController {
    
    private let navBar = OverviewNavBar()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        view.addView(navBar)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: navBar.trailingAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        navigationController?.navigationBar.isHidden = true
    }
}

