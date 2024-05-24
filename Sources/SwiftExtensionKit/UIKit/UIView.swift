import UIKit


public extension UIView {
    
    private struct AssociatedKeys {
        static var borderColor = "borderColor"
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            return objc_getAssociatedObject(self, &AssociatedKeys.borderColor) as? UIColor
        }
        set {
            self.layer.borderColor = newValue?.cgColor
            objc_setAssociatedObject(
                self,
                &AssociatedKeys.borderColor,
                newValue,
                .OBJC_ASSOCIATION_RETAIN_NONATOMIC
            )
        }
    }
    
    static func swizzleTraitCollectionDidChange() {
        let originalSelector = #selector(traitCollectionDidChange(_:))
        let swizzledSelector = #selector(swizzledTraitCollectionDidChange)
        
        UIView.swizzle(originalSelector: originalSelector, swizzledSelector: swizzledSelector)
    }
    
    @objc func swizzledTraitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if self.traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
            self.subviews.forEach { view in
                if view is UIImageView { // UIImageView는 traitCollectionDidChange이 호출 되지 않아서 아래에서 처리
                    if let cgColor = view.borderColor?.cgColor {
                        view.layer.borderColor = cgColor
                    }
                }
            }
            self.layer.borderColor = self.borderColor?.cgColor
        }
    }
    
    static func swizzle(originalSelector: Selector, swizzledSelector: Selector) {
        guard let originalMethod = class_getInstanceMethod(self, originalSelector),
              let swizzledMethod = class_getInstanceMethod(self, swizzledSelector)
        else { return }
        
        let didAddMethod = class_addMethod(
            self,
            originalSelector,
            method_getImplementation(swizzledMethod),
            method_getTypeEncoding(swizzledMethod)
        )
        
        if didAddMethod {
            class_replaceMethod(
                self,
                swizzledSelector, method_getImplementation(originalMethod),
                method_getTypeEncoding(originalMethod)
            )
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod)
        }
    }
}
