import UIKit

final class TrainingCellView: WABaseCollectionViewCell {
    static let id = "TrainingCellView"
    
    private let checkmarkView = UIImageView(image: Res.Images.OverView.checkmarkNoDone)
    
    private let rightArrowView = UIImageView(image: Res.Images.OverView.rightArrow)
    
    private let title = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 17)
        $0.textColor = Res.Colors.titleGray
    }
    
    private let subtitle = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 13)
        $0.textColor = Res.Colors.inActive
    }
    private lazy var stackView = UIStackView(arrangedSubviews: [title, subtitle])
    
    func configure(with title: String, subtitle: String, isDone: Bool) {
        self.title.text = title
        self.subtitle.text = subtitle
        checkmarkView.image = isDone ? Res.Images.OverView.checkmarkDone : Res.Images.OverView.checkmarkNoDone
    }
}

extension TrainingCellView {
    override func setupViews() {
        super.setupViews()
        addView(checkmarkView)
        addView(stackView)
        addView(rightArrowView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 28),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            rightArrowView.leadingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: 15),
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            trailingAnchor.constraint(equalTo: rightArrowView.trailingAnchor, constant: 15),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .white
    }
}
