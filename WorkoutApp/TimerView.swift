import UIKit

final class TimerView: WABaseInfoView {
    private let progressView = ProgressView().then {
        $0.drawProgress(with: 0)
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
        progressView.backgroundColor = .blue
    }
}
