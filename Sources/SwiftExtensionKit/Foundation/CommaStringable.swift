import Foundation


protocol CommaStringable {
    func commaString() -> String
}

extension Int: CommaStringable {
    
    static let decimalNumberFormmtter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.locale = Locale(identifier: "en_US") // 모든국가에서 쉼표 위치를 통일
        return formatter
    }()
    
    public func commaString() -> String {
        return Self.decimalNumberFormmtter.string(from: NSNumber(value: self)) ?? "0"
    }
}

extension Double: CommaStringable {
    
    static let decimalNumberFormmtter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    public func commaString() -> String {
        return Self.decimalNumberFormmtter.string(from: NSNumber(value: self)) ?? "0"
    }
}
