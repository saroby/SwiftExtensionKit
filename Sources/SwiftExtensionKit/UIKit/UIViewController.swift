#if canImport(UIKit)
import UIKit


extension UIViewController {
    
    public func presented(viewControllerPresent parent: UIViewController? = UIApplication.getTopVC(), animated: Bool, completion: (()-> Void)? = nil) {
        parent?.present(self, animated: animated, completion: completion)
    }
}
#endif
