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
    var callBack: (() -> Void)?
    public var timerState = TimerState.isStopped
    
    private let elapsedTimeLabel = UILabel().then {
        $0.text = Res.Strings.Session.elapsedTime
        $0.font = Res.Fonts.helveticaRegular(with: 14)
        $0.textColor = Res.Colors.inActive
        $0.textAlignment = .center
    }
    
    private let elapsedTimeValueLabel = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 46)
        $0.textColor = Res.Colors.titleGray
        $0.textAlignment = .center
    }
    
    private let renamingTimeLabel = UILabel().then {
        $0.text = Res.Strings.Session.remainingTime
        $0.font = Res.Fonts.helveticaRegular(with: 13)
        $0.textColor = Res.Colors.inActive
        $0.textAlignment = .center
    }
    private let renamingTimeValueLabel = UILabel().then {
        $0.font = Res.Fonts.helveticaRegular(with: 13)
        $0.textColor = Res.Colors.titleGray
        $0.textAlignment = .center
    }
    
    lazy var stackView = UIStackView(arrangedSubviews: [elapsedTimeLabel,
                                                        elapsedTimeValueLabel,
                                                        renamingTimeLabel,
                                                        renamingTimeValueLabel]).then {
        $0.axis = .vertical
        $0.spacing = 10
    }
    
    let completedPercentView = PercentView()
    let remainingPercentView = PercentView()
    let separatorView = UIView().then {
        $0.backgroundColor = Res.Colors.separator
    }
    lazy var percentStack = UIStackView(arrangedSubviews: [
        completedPercentView, separatorView, remainingPercentView]).then {
        $0.spacing = 25
    }
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDevider = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDevider
        elapsedTimeValueLabel.text = getDisplayedString(from: Int(tempCurrentValue))
        renamingTimeValueLabel.text = getDisplayedString(from: Int(duration - tempCurrentValue))
        completedPercentView.configure(with: Int(100 * percent), and: "COMPLETED")
        remainingPercentView.configure(with: Int(100 * (1 - percent)), and: "REMAINING")
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer(completion: @escaping (CGFloat) -> Void) {
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01,
                                     repeats: true) { [weak self] timer in
            guard let self = self else {return}
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration {
                self.timerProgress = self.timerDuration
                timer.invalidate()
                completion(self.timerProgress)
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
            self.timerProgress -= self.timerDuration * 0.02
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
        addView(stackView)
        addView(percentStack)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 5),
            progressView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 5),
            trailingAnchor.constraint(equalToSystemSpacingAfter: progressView.trailingAnchor, multiplier: 5),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),

            
            stackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            
            percentStack.topAnchor.constraint(equalTo: progressView.bottomAnchor),
            percentStack.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            bottomAnchor.constraint(equalToSystemSpacingBelow: percentStack.bottomAnchor, multiplier: 1),
            percentStack.heightAnchor.constraint(equalToConstant: 50),
            percentStack.widthAnchor.constraint(equalToConstant: 175),
            separatorView.widthAnchor.constraint(equalToConstant: 1),
            separatorView.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
    }
}

private extension TimerView {
    func getDisplayedString(from value: Int) -> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600
        return hours == 0
        ? String(format: "%02d:%02d", minutes, seconds)
        : String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}
