#if canImport(UIKit)
import UIKit

extension UIColor {
    public convenience init(light: CGColor, dark: CGColor) {
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

@objc extension UIColor {
    public static func hexSet(light: Int, dark: Int) -> UIColor {
        return UIColor { $0.userInterfaceStyle == .dark ? .init(hex: dark) : .init(hex: light) }
    }

    public static func colorSet(light: UIColor, dark: UIColor) -> UIColor {
        return UIColor { $0.userInterfaceStyle == .dark ? dark : light }
    }

    public var light: UIColor {
        return self.resolvedColor(with: .init(userInterfaceStyle: .light))
    }

    public var dark: UIColor {
        return self.resolvedColor(with: .init(userInterfaceStyle: .dark))
    }
}

extension UIColor {
    // mode = nil 이면 상태에 맞는 현재 Color 리턴
    public func manual(mode: UIUserInterfaceStyle?) -> UIColor {
        guard let mode = mode else {
            return self
        }

        return self.resolvedColor(with: .init(userInterfaceStyle: mode))
    }
}

@objc extension UIColor {
    public static var random: UIColor {
        return UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1.0)
    }

    public func setAlpha(_ a: CGFloat) -> UIColor {
        return self.withAlphaComponent(a)
    }

    public func pressColor() -> UIColor {
        return self.setAlpha(0.5)
    }
}

#endif
