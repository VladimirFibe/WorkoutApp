import UIKit

public enum WorkoutButtonType {
    case primary
    case secondary
}

class WAButton: UIButton {
    private let type: WorkoutButtonType
    private let title: String
    private let label = UILabel().then {
        $0.textAlignment = .center
    }
    
    private let icon = UIImageView().then {
        $0.image = Res.Images.Common.downArrow.withRenderingMode(.alwaysTemplate)
    }
    
    init(with type: WorkoutButtonType, and title: String) {
        self.type = type
        self.title = title
        super.init(frame: .zero)
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        self.type = .primary
        self.title = ""
        super.init(coder: coder)
        addViews()
        layoutViews()
        configure()
    }
}

private extension WAButton {
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
        label.text = title
        switch type {
        case .primary:
            label.textColor = Res.Colors.inActive
            icon.tintColor = Res.Colors.inActive
            label.font = Res.Fonts.helveticaRegular(with: 13)
        case .secondary:
            backgroundColor = Res.Colors.secondary
            layer.cornerRadius = 14
            label.textColor = Res.Colors.active
            icon.tintColor = Res.Colors.active
            label.font = Res.Fonts.helveticaRegular(with: 15)
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        makeSystem(self)
    }

}
