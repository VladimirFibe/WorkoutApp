import UIKit

class WABaseCollectionViewCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        layoutViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        setupViews()
        layoutViews()
        configureAppearance()
    }
}

@objc extension WABaseCollectionViewCell {
    func setupViews() {}
    func layoutViews() {}
    func configureAppearance() {}
}

