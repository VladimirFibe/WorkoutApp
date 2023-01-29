import UIKit

final class SessionController: WABaseController {
    private let timerView = TimerView()
    private let timerDuration = 3.0
    
    override func navBarLeftButtonHandler() {
        if timerView.timerState != .isRunning {
            timerView.startTimer()
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
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            timerView.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: timerView.trailingAnchor, multiplier: 2),
            timerView.heightAnchor.constraint(equalToConstant: 300)
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
