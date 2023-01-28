import UIKit

final class SessionController: BaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "High Intensity Cardio"
        addNavBarButton(at: .left, with: "Pause")
        addNavBarButton(at: .right, with: "Finish")
    }
}
