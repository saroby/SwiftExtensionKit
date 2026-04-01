#if canImport(UIKit)
import UIKit

extension CGColor {
    private static func _rgba(hex: String) -> (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let string = hex.trimmingCharacters(in: CharacterSet(charactersIn: "#")).uppercased()
        var rgbValue: UInt64 = 0
        Scanner(string: string).scanHexInt64(&rgbValue)

        let alpha: CGFloat
        // MARK: hex 값이 rgba인 경우 alpha 처리
        if string.count == 8 {
            alpha = CGFloat(rgbValue & 0x000000FF) / 255.0
            rgbValue = (rgbValue >> 8)
        } else {
            alpha = 1.0
        }

        return (
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: alpha
        )
    }

    public class func rgba(hex: String) -> CGColor {
        let rgba = Self._rgba(hex: hex)
        return Self(srgbRed: rgba.red, green: rgba.green, blue: rgba.blue, alpha: rgba.alpha)
    }

    public class func rgba(hex: String, alpha: CGFloat) -> CGColor {
        let rgba = Self._rgba(hex: hex)
        return Self(srgbRed: rgba.red, green: rgba.green, blue: rgba.blue, alpha: alpha)
    }
}
#endif
