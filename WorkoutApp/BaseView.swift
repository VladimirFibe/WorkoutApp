import UIKit

class BaseView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layoutViews()
        configureViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
@objc extension BaseView {
    func setupViews() {}
    func layoutViews() {}
    func configureViews() {}
}
