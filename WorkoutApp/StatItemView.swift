import UIKit

final class StatItemView: WABaseView {
    private let imageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
    }
    private let valueLabel = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 17)
        $0.textColor = Res.Colors.titleGray
        
    }
    private let titleLabel = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 10)
        $0.textColor = Res.Colors.inActive
    }
    
    lazy var textStack = UIStackView(arrangedSubviews: [valueLabel, titleLabel]).then {
        $0.axis = .vertical
    }
    
    func configure(with title: String, value: String, image: UIImage? = nil) {
        imageView.image = image
        valueLabel.text = value
        titleLabel.text = title
    }
}

extension StatItemView {
    override func setupViews() {
        super.setupViews()
        addView(imageView)
        addView(textStack)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 23),
            textStack.leadingAnchor.constraint(equalToSystemSpacingAfter: imageView.trailingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalTo: textStack.trailingAnchor),
            textStack.topAnchor.constraint(equalTo: topAnchor),
            bottomAnchor.constraint(equalTo: textStack.bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
