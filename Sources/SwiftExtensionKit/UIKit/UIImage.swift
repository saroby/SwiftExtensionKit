#if canImport(UIKit)
import UIKit.UIImage

extension UIKit.UIImage {
    public func resizedImage(for size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)

        return renderer.image { context in
            self.draw(in: CGRect(origin: .zero, size: size))
        }
    }
}

#endif
