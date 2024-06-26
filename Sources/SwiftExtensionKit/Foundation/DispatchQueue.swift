import Foundation


extension DispatchQueue {
    
    public func asyncNext(_ delay: TimeInterval, execute work: @escaping () -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + delay) { self.async { work() } }
    }
}
