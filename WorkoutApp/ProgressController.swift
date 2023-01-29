import UIKit

final class ProgressController: WABaseController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Workout Progress"
        addNavBarButton(at: .left, with: "Export")
        addNavBarButton(at: .right, with: "Details")
    }
    
    override func navBarRightButtonHandler() {}
}
