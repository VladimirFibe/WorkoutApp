import UIKit

class BaseInfoView: BaseView {
    private let titleLabel: UILabel = {
        $0.font = Res.Fonts.helveticaRegular(with: 13)
        $0.textColor = Res.Colors.inActive
        return $0
    }(UILabel())
    
    private let contentView: UIView = {
        $0.backgroundColor = .white
        $0.layer.borderColor = Res.Colors.separator.cgColor
        $0.layer.borderWidth = 1
        $0.layer.cornerRadius = 5
        return $0
    }(UIView())
    
    init(with title: String? = nil, alignment: NSTextAlignment = .left) {
        titleLabel.text = title?.uppercased()
        titleLabel.textAlignment = alignment
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseInfoView {
    override func setupViews() {
        super.setupViews()
        addView(titleLabel)
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
            
            contentView.topAnchor.constraint(equalToSystemSpacingBelow: contentTopAnchor, multiplier: contentTopOffset),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        backgroundColor = .clear
    }
}
