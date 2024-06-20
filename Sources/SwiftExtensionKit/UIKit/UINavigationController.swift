#if canImport(UIKit)
import UIKit


extension UINavigationController {
    
    public func pushViewController(viewController: UIViewController, animated: Bool, completion: @escaping () -> Void) {
        self.pushViewController(viewController, animated: animated)
        
        if animated, let coordinator = self.transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
    
    public func popViewController(animated: Bool, completion: @escaping () -> Void) {
        self.popViewController(animated: animated)
        
        if animated, let coordinator = self.transitionCoordinator {
            coordinator.animate(alongsideTransition: nil) { _ in
                completion()
            }
        } else {
            completion()
        }
    }
}
#endif
