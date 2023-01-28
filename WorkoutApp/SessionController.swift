import UIKit

final class SessionController: BaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = Resources.Strings.NavBar.session
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
    }
}
