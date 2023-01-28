import UIKit

final class NavBarController: UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    private func configure() {
        view.backgroundColor = .white
        navigationBar.isTranslucent = false
        navigationBar.standardAppearance.titleTextAttributes = [
            .foregroundColor: Res.Colors.titleGray,
            .font: Res.Fonts.helveticaRegular(with: 17)
        ]
        navigationBar.addBottomBorder(with: Res.Colors.separator,
                                      height: 1)
    }
}
