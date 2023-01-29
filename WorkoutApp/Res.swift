import UIKit

enum Res {
    enum Colors {
        static let active       = UIColor(hex: "#437BFEFF")
        static let inActive     = UIColor(hex: "#929DA5FF")
        
        static let separator    = UIColor(hex: "#E8ECEFFF")
        static let titleGray    = UIColor(hex: "#545C77FF")
        static let secondary    = UIColor(hex: "#F0F3FFFF")
        
        static let background   = UIColor(hex: "#F8F9F9FF")
        
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
            static let session  = "High Intensity Cardio"
            static let progress = "Workout Progress"
            static let settings = "Settings"
        }
        
        enum Overview {
            static let allWorkoutsButton = "All Workouts"
        }
        
        enum Session {
            static let navBarStart      = "Start   "
            static let navBarPause      = "Pause"
            static let navBarFinish     = "Finish"
            
            static let elapsedTime      = "Elapsed Time"
            static let remainingTime    = "Renaiming Time"
            static let completed        = "Completed"
            static let remaining        = "Remainig"
            
            static let workoutStats     = "Workout stats"
            static let averagePace      = "Average pace"
            static let heartRate        = "Heart rate"
            static let totalDistance    = "Total distance"
            static let totalSteps       = "Tatal steps"
            
            static let stepsCounter     = "Steps Counter"
        }
        
        enum Progress {
            static let navBarLetf   = "Export"
            static let navBarRight  = "Details"
            
            static let dailyPerformance = "Daily performance"
            static let last7Days = "Last 7 days"
            static let monthlyPerformance = "Monthly performance"
            static let last10Months = "Last 10 months"
        }
        
        enum Settings {}
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
        
        enum Session {
            enum Stats {
                static let averagePace      = #imageLiteral(resourceName: "speed")
                static let heartRate        = #imageLiteral(resourceName: "heartbeat")
                static let totalDistance    = #imageLiteral(resourceName: "maps")
                static let totalSteps       = #imageLiteral(resourceName: "steps")
            }
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
}
