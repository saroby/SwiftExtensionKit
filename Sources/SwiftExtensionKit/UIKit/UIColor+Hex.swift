#if canImport(UIKit)
import UIKit

// HEX Color 지원
extension UIColor {
    public convenience init(red: Int, green: Int, blue: Int, alpha: Int = 100) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: CGFloat(alpha) / 100.0)
    }

    public convenience init(hex: Int, alpha: Int = 100) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF, alpha: alpha)
    }

    @objc public convenience init(hex: String, alpha: CGFloat = 1.0) {
        var alpha = alpha
        let string = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#")).uppercased()
        var rgbValue: UInt64 = 0
        Scanner(string: string).scanHexInt64(&rgbValue)

        // MARK: hex 값이 rgba인 경우 alpha 처리
        if string.count == 8 {
            alpha = CGFloat(rgbValue & 0x000000FF) / 255.0
            rgbValue = (rgbValue >> 8)
        }

        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }

    public func hexString() -> String {
        let r = self.cgColor.components?[safe: 0] ?? 0.0
        let g = self.cgColor.components?[safe: 1] ?? 0.0
        let b = self.cgColor.components?[safe: 2] ?? 0.0

        return String(
            format: "#%02lX%02lX%02lX",
            lroundf(Float(r * 255)),
            lroundf(Float(g * 255)),
            lroundf(Float(b * 255))
        )
    }
}
#endif
