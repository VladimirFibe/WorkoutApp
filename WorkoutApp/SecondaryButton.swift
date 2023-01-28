import UIKit

final class SecondaryButton: UIButton {
    private let label: UILabel = {
        $0.textColor = Resources.Colors.active
        $0.font = Resources.Fonts.helveticaRegular(with: 15)
        $0.textAlignment = .center
        return $0
    }(UILabel())
    
    private let icon: UIImageView = {
        $0.image = Resources.Images.Common.downArrow.withRenderingMode(.alwaysTemplate)
        $0.tintColor = Resources.Colors.active
        return $0
    }(UIImageView())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTitle(_ title: String) {
        label.text = title
    }
}

private extension SecondaryButton {
    func addViews() {
        addView(label)
        addView(icon)
    }
    func layoutViews() {
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalTo: icon.trailingAnchor, constant: 10),
            icon.heightAnchor.constraint(equalToConstant: 5),
            icon.widthAnchor.constraint(equalToConstant: 10),
            
            icon.leadingAnchor.constraint(equalTo: label.trailingAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
        ])
    }
    func configure() {
        backgroundColor = Resources.Colors.secondary
        layer.cornerRadius = 14
        translatesAutoresizingMaskIntoConstraints = false
        makeSystem(self)
    }

}
