import UIKit

extension UIEdgeInsets {
    
    public static func zero(top: CGFloat = .zero, left: CGFloat = .zero, bottom: CGFloat = .zero, right: CGFloat = .zero) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
    
    public static func zero(horizontal: CGFloat = .zero, vertical: CGFloat = .zero) -> UIEdgeInsets {
        return UIEdgeInsets(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    public static func horizontal(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: value, bottom: .zero, right: value)
    }
    
    public static func vertical(_ value: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: value, left: .zero, bottom: value, right: .zero)
    }
    
    public static func all(_ all: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: all, left: all, bottom: all, right: all)
    }
}
