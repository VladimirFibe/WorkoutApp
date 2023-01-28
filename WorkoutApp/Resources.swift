import UIKit

enum Resources {
    enum Colors {
        static var active = UIColor(hex: "#437BFEFF")!
        static var inActive = UIColor(hex: "#929DA5FF")!
        static var separator = UIColor(hex: "#E8ECEFFF")!
        static var titleGray = UIColor(hex: "#545C77FF")!
        static var bacground = UIColor(hex: "#F8F9F9FF")!
    }
    
    enum Strings {
        enum TabBar {
            static var overview = "Overview"
            static var session = "Session"
            static var progress = "Progress"
            static var settings = "Settings"
        }
    }
    
    enum Images {
        enum TabBar {
            static var overview = #imageLiteral(resourceName: "house")
            static var session = #imageLiteral(resourceName: "progress")
            static var progress = #imageLiteral(resourceName: "clock")
            static var settings = #imageLiteral(resourceName: "gear")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont.systemFont(ofSize: size)
        }
    }
    
}
