import UIKit

enum Res {
    enum Colors {
        static let active = UIColor(hex: "#437BFEFF")
        static let inActive = UIColor(hex: "#929DA5FF")
        
        static let separator = UIColor(hex: "#E8ECEFFF")
        static let titleGray = UIColor(hex: "#545C77FF")
        static let secondary = UIColor(hex: "#F0F3FFFF")
        
        static let background = UIColor(hex: "#F8F9F9FF")
        
    }
    
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Overview"
                case .session : return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        
        enum NavBar {
            static let overview = "Today"
            static let session = "High Intensity Cardio"
            static let progress = "Workout Progress"
            static let settings = "Settings"
        }
        
        enum Overview {
            static let allWorkoutsButton = "All Workouts"
        }
    }
    
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage {
                switch tab {
                case .overview: return #imageLiteral(resourceName: "house")
                case .session : return #imageLiteral(resourceName: "progress")
                case .progress: return #imageLiteral(resourceName: "clock")
                case .settings: return #imageLiteral(resourceName: "gear")
                }
            }
        }
        
        enum Common {
            static let downArrow = #imageLiteral(resourceName: "downArrow")
            static let addButton = #imageLiteral(resourceName: "addButton")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
}
