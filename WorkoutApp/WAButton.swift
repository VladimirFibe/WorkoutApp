import UIKit

public enum WorkoutButtonType {
    case primary
    case secondary
}

class WAButton: UIButton {
    private var type: WorkoutButtonType = .primary
    private let label = UILabel()
    
    private let icon = UIImageView(image: Res.Images.Common.downArrow.withRenderingMode(.alwaysTemplate))
    
    init(with type: WorkoutButtonType) {
        super.init(frame: .zero)
        
        self.type = type
        addViews()
        layoutViews()
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        addViews()
        layoutViews()
        configure()
    }
    
    func setTitle(_ title: String?) {
        label.text = title
    }
}

private extension WAButton {
    func addViews() {
        addView(label)
        addView(icon)
    }
    func layoutViews() {
        var horisontalOffset: CGFloat {
            switch type {
            case .primary: return 0
            case .secondary: return 10
            }
        }
        NSLayoutConstraint.activate([
            icon.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalTo: icon.trailingAnchor, constant: horisontalOffset),
            icon.heightAnchor.constraint(equalToConstant: 5),
            icon.widthAnchor.constraint(equalToConstant: 10),
            
            icon.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 10),
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 2 * horisontalOffset)
        ])
    }
    func configure() {
        label.textAlignment = .center
        switch type {
        case .primary:
            label.textColor = Res.Colors.inActive
            icon.tintColor  = Res.Colors.inActive
            label.font      = Res.Fonts.helveticaRegular(with: 13)
        case .secondary:
            backgroundColor     = Res.Colors.secondary
            layer.cornerRadius  = 14
            label.textColor     = Res.Colors.active
            icon.tintColor      = Res.Colors.active
            label.font          = Res.Fonts.helveticaRegular(with: 15)
        }
        
        makeSystem(self)
    }

}
