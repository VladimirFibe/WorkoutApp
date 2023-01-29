import UIKit

enum TimerState {
    case isRunning
    case isPaused
    case isStopped
}
final class TimerView: WABaseInfoView {
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration: Double = 0
    
    public var timerState = TimerState.isStopped
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer() {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true) { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        }
    }
    
    func pauseTimer() {
        timer.invalidate()
    }
    
    func stopTimer() {
        guard self.timerProgress > 0 else { return }
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.1,
                                     repeats: true) { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress -= 0.1
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        }
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
