import Foundation

extension CGSize {
    
    public static func all(_ value: CGFloat) -> CGSize {
        return Self.init(width: value, height: value)
    }
    
    public static func width(_ value: CGFloat) -> CGSize {
        return Self.init(width: value, height: .zero)
    }
    
    public static func height(_ value: CGFloat) -> CGSize {
        return Self.init(width: .zero, height: value)
    }
}
