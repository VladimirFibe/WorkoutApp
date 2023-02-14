import UIKit

final class SectionHeaderView: WABaseCollectionReusableView {
    static let id = "SectionHeaderView"
    private let title = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 13)
        $0.textColor = Res.Colors.inActive
        $0.textAlignment = .center
    }
    func configure(with text: String) {
        title.text = text.uppercased()
    }
}
extension SectionHeaderView {
    override func setupViews() {
        super.setupViews()
        addView(title)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
