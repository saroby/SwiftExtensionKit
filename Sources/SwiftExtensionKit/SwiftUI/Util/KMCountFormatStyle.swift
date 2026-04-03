import SwiftUI

public struct KMCountFormatStyle: FormatStyle {
    public func format(_ value: Int) -> String {
        if value >= 1_000_000_000 {
            let formatted = String(format: "%.1fB", Double(value) / 1_000_000_000)
            return formatted.hasSuffix(".0M") ? String(formatted.dropLast(2)) + "M" : formatted
        } else if value >= 1_000_000 {
            let formatted = String(format: "%.1fM", Double(value) / 1_000_000)
            return formatted.hasSuffix(".0M") ? String(formatted.dropLast(2)) + "M" : formatted
        } else if value >= 1_000 {
            let formatted = String(format: "%.1fK", Double(value) / 1_000)
            return formatted.hasSuffix(".0K") ? String(formatted.dropLast(2)) + "K" : formatted
        } else {
            return "\(value)"
        }
    }
    
    public init() {}
}
