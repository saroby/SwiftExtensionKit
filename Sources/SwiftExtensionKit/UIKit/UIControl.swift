#if canImport(UIKit)
import UIKit


extension UIControl {

    public func addAction(for controlEvents: UIControl.Event, _ action: @escaping () -> Void) {
        self.addAction(UIAction { _ in action() }, for: controlEvents)
    }
}
#endif
