import UIKit

enum StatsItem {
    case averagePace(String)
    case heartRate(String)
    case totalDistance(String)
    case totalSteps(String)

    var data: StatItemView.ItemData {
        switch self {
        case .averagePace(let value):
            return .init(image: Res.Images.Session.Stats.averagePace,
                         value: value + " / km",
                         title: Res.Strings.Session.averagePace)
        case .heartRate(let value):
            return .init(image: Res.Images.Session.Stats.heartRate,
                         value: value + " bpm",
                         title: Res.Strings.Session.heartRate)
        case .totalDistance(let value):
            return .init(image: Res.Images.Session.Stats.totalDistance,
                         value: value + " km",
                         title: Res.Strings.Session.totalDistance)
        case .totalSteps(let value):
            return .init(image: Res.Images.Session.Stats.totalSteps,
                         value: value,
                         title: Res.Strings.Session.totalSteps)
        }
    }
}

final class StatItemView: WABaseView {
    struct ItemData {
        let image: UIImage?
        let value: String
        let title: String
    }
    
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
        $0.spacing = 3
        $0.distribution = .fillProportionally
    }
    
    func configure(with item: StatsItem) {
        imageView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title.uppercased()
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
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}
