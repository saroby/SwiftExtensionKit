import Foundation

extension CGSize {
    public init(size: Double) {
        self.init(width: size, height: size)
    }

    public static func size(_ size: CGFloat) -> CGSize {
        return .init(size: size)
    }
}
