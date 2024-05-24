import Foundation


extension CGSize {
    
    static func all(_ value: CGFloat) -> CGSize {
        return Self.init(width: value, height: value)
    }
}
