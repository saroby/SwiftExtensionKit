import UIKit

public extension UIColor {
    
    convenience init(light: CGColor, dark:CGColor) {
        self.init { traitCollection in
            switch traitCollection.userInterfaceStyle {
            case .dark:
                return .init(cgColor: dark)
            case .light:
                fallthrough
            default:
                return .init(cgColor: light)
            }
        }
    }
}
