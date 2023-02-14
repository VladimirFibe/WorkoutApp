import UIKit

final class OverviewController: WABaseController {
    
    private let navBar = OverviewNavBar()
    
    private let header = SectionHeaderView()
    private let cell = TrainingCellView()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}

extension OverviewController {
    override func setupViews() {
        super.setupViews()
        view.addView(navBar)
        view.addView(header)
        view.addView(cell)
    }
    
    override func layoutViews() {
        super.layoutViews()
        NSLayoutConstraint.activate([
            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: navBar.trailingAnchor),
            
            header.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            header.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: header.trailingAnchor, constant: 16),
            header.heightAnchor.constraint(equalToConstant: 32),
            
            cell.topAnchor.constraint(equalTo: header.bottomAnchor),
            cell.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            view.trailingAnchor.constraint(equalTo: cell.trailingAnchor, constant: 16),
            cell.heightAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        navigationController?.navigationBar.isHidden = true
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMMM dd"
        
        header.configure(with: dateFormatter.string(from: Date()))
        cell.configure(with: "Warm Up Cardio", subtitle: "Strair Climber • 10 minutes", isDone: true)
        cell.layoutIfNeeded()
        cell.roundCorners([.bottomRight, .bottomLeft], radius: 5)
    }
}

