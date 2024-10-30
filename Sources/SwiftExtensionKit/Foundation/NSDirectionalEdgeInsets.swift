import UIKit


extension NSDirectionalEdgeInsets {
    public static func zero(top: CGFloat = .zero, leading: CGFloat = .zero, bottom: CGFloat = .zero, trailing: CGFloat = .zero) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    public static func zero(horizontal: CGFloat = .zero, vertical: CGFloat = .zero) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    public static func horizontal(_ value: CGFloat) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: .zero, leading: value, bottom: .zero, trailing: value)
    }
    
    public static func vertical(_ value: CGFloat) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: value, leading: .zero, bottom: value, trailing: .zero)
    }
    
    public static func all(_ all: CGFloat) -> NSDirectionalEdgeInsets {
        return NSDirectionalEdgeInsets(top: all, leading: all, bottom: all, trailing: all)
    }
}

