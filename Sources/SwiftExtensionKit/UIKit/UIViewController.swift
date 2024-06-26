#if canImport(UIKit)
import UIKit


extension UIViewController {
    
    @MainActor
    public func presented(viewControllerPresent parent: UIViewController, animated: Bool, completion: (()-> Void)? = nil) {
        parent.present(self, animated: animated, completion: completion)
    }
}
#endif
