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
#endif
