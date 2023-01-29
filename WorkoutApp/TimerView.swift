import UIKit

final class TimerView: WABaseInfoView {
    private let progressView = ProgressView()
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration: Double = 0
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        
        progressView.drawProgress(with: CGFloat(percent))
    }
}

extension TimerView {
    override func setupViews() {
        super.setupViews()
        addView(progressView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5),
            progressView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: progressView.trailingAnchor, multiplier: 5),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor)
        ])
    }
    
    override func configureViews() {
        super.configureViews()
    }
}
