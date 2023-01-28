import UIKit

final class WeekDayView: BaseView {
    private let nameLabel = UILabel()
    private let dateLabel = UILabel()
    private lazy var stackView = UIStackView(arrangedSubviews: [nameLabel, dateLabel])
    
    func configure(with index: Int, and name: String) {
        let startOfWeek = Date().startOfWeek
        let currentDay = startOfWeek.agoForward(to: index)
        let day = Calendar.current.component(.day, from: currentDay)
        let isToday = currentDay.stripTime() == Date().stripTime()
        backgroundColor = isToday ? Resources.Colors.active : Resources.Colors.background
        nameLabel.text = name.uppercased()
        nameLabel.textColor = isToday ? .white : Resources.Colors.inActive
        dateLabel.text = String(day)
        dateLabel.textColor = isToday ? .white : Resources.Colors.inActive
    }
}

extension WeekDayView {
    override func addViews() {
        super.addViews()
        addView(stackView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
        layer.cornerRadius = 5
        layer.masksToBounds = true
        backgroundColor = .red
        nameLabel.font = Resources.Fonts.helveticaRegular(with: 9)
        nameLabel.textAlignment = .center
        dateLabel.font = Resources.Fonts.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center
        stackView.spacing = 3
        stackView.axis = .vertical
    }
}
