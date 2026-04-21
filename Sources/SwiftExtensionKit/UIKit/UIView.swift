#if canImport(UIKit)
import UIKit

extension UIView {
    public convenience init(size: CGSize) {
        self.init(frame: .init(origin: .zero, size: size))
    }
    
    public func addSubviews(_ views: UIView ...) {
        views.forEach { self.addSubview($0) }
    }
}

// MARK: Layer

extension UIView {
    public typealias Border = (width: CGFloat, color: UIColor)

    @objc public var circle: Bool {
        get {
            return (self.layer.cornerRadius == 0.0)
        } set (newValue) {
            self.radius = newValue ? (self.frame.size.width / 2) : 0.0
        }
    }

    @objc public var ellipse: Bool {
        get {
            return (self.layer.cornerRadius == 0.0)
        } set (newValue) {
            self.radius = newValue ? (self.frame.size.height / 2) : 0.0
        }
    }

    @objc public var radius: CGFloat {
        get {
            return self.layer.cornerRadius
        } set (newValue) {
            self.layer.cornerRadius = newValue
            self.layer.masksToBounds = true
            self.clipsToBounds = true
        }
    }

    public var border: Border {
        get {
            return (self.borderWidth, self.borderColor ?? .clear)
        } set (newValue) {
            self.borderWidth = newValue.width
            self.borderColor = newValue.color
        }
    }

    // MARK: 특정 부분에 radius 적용
    //   ex. self.controlView.radius([.topLeft, .topRight], radius: 4.0)
    public func radius(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}

#endif
