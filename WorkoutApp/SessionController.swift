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
    
    override func configureViews() {
        super.configureViews()
        
        title = Res.Strings.NavBar.session
        navigationController?.tabBarItem.title = Res.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: Res.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: Res.Strings.Session.navBarFinish)
        
        timerView.configure(with: timerDuration, progress: 0)
    }
}
