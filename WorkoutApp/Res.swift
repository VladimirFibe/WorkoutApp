import UIKit

enum Res {
    enum Colors {
        static var active = UIColor(hex: "#437BFEFF")
        static var inActive = UIColor(hex: "#929DA5FF")
        
        static var separator = UIColor(hex: "#E8ECEFFF")
        static var titleGray = UIColor(hex: "#545C77FF")
        static var secondary = UIColor(hex: "#F0F3FFFF")
        
        static var background = UIColor(hex: "#F8F9F9FF")
        
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
            static var overview = "Today"
            static var session = "High Intensity Cardio"
            static var progress = "Workout Progress"
            static var settings = "Settings"
        }
        
        enum Overview {
            static var allWorkoutsButton = "All Workouts"
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
            static var downArrow = #imageLiteral(resourceName: "downArrow")
            static var addButton = #imageLiteral(resourceName: "addButton")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
}
