import UIKit

class WABaseInfoView: WABaseView {
    private let titleLabel = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 13)
        $0.textColor = Res.Colors.inActive
    }
    
    private let button = WAButton(with: .primary)
    let contentView = UIView().then {
        $0.backgroundColor = .white
        $0.layer.borderColor = Res.Colors.separator.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
    }
    
    init(with title: String? = nil, buttonTitle: String? = nil) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = buttonTitle == nil ? .center : .left
        
        button.setTitle(buttonTitle?.uppercased())
        button.isHidden = buttonTitle == nil
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addButtonTarget(_ target: Any?, action: Selector) {
        button.addTarget(self, action: action, for: .primaryActionTriggered)
    }
}

extension WABaseInfoView {
    override func setupViews() {
        super.setupViews()
        addView(titleLabel)
        addView(button)
        addView(contentView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        let hasTitle = titleLabel.text != nil
        let contentTopAnchor: NSLayoutYAxisAnchor = hasTitle ? titleLabel.bottomAnchor : topAnchor
        let contentTopOffset: CGFloat = hasTitle ? 1 : 0
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            trailingAnchor.constraint(equalTo: button.trailingAnchor),
            button.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 28),
            
            contentView.topAnchor.constraint(equalToSystemSpacingBelow: contentTopAnchor, multiplier: contentTopOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
