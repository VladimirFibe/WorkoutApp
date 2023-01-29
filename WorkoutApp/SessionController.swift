import UIKit

final class SessionController: WABaseController {
    private let timerView = TimerView()
    private let statsView = StatsView(with: Res.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: Res.Strings.Session.stepsCounter)
    lazy var stack = UIStackView(arrangedSubviews: [statsView, stepsView]).then {
        $0.spacing = 16
        $0.distribution = .fillEqually
    }
    private let timerDuration = 40.0
    
    override func navBarLeftButtonHandler() {
        if timerView.timerState != .isRunning {
            timerView.startTimer { [weak self] time in
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    self?.navBarRightButtonHandler()
                }
            }
            timerView.timerState = .isRunning
            setTitleForNavBarButton(Res.Strings.Session.navBarPause, at: .left)
        } else {
            timerView.pauseTimer()
            timerView.timerState = .isPaused
            setTitleForNavBarButton(Res.Strings.Session.navBarStart, at: .left)
        }
    }
    
    override func navBarRightButtonHandler() {
        timerView.stopTimer()
        timerView.timerState = .isStopped
        setTitleForNavBarButton(Res.Strings.Session.navBarStart, at: .left)
    }
}

extension SessionController {
    override func setupViews() {
        super.setupViews()
        view.addView(timerView)
        view.addView(stack)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            timerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: timerView.trailingAnchor, multiplier: 2),
            stack.topAnchor.constraint(equalToSystemSpacingBelow: timerView.bottomAnchor, multiplier: 2),
            stack.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: stack.trailingAnchor, multiplier: 2),
            view.safeAreaLayoutGuide.bottomAnchor.constraint(equalToSystemSpacingBelow: stack.bottomAnchor, multiplier: 2)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        title = Res.Strings.NavBar.session
        navigationController?.tabBarItem.title = Res.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: Res.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: Res.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
        
        statsView.configure(with: [.heartRate("155"),
                                   .averagePace("8'20''"),
                                   .totalSteps("7,682"),
                                   .totalDistance("8.25")])
     
        stepsView.configure(with: [.init(value: "8k", heightMultiplier: 1, title: "2/14"),
                                   .init(value: "7k", heightMultiplier: 0.8, title: "2/15"),
                                   .init(value: "5k", heightMultiplier: 0.6, title: "2/16"),
                                   .init(value: "6k", heightMultiplier: 0.7, title: "2/17")])
    }
}
