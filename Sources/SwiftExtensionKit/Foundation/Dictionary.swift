import Foundation

extension Dictionary {
    
    public mutating func removeValues(keys: [Key]) {
        keys.forEach { key in
            self.removeValue(forKey: key)
        }
    }
    
    public static func += (lhs: inout [Key : Value], rhs: [Key : Value]) {
        lhs.merge(rhs) { $1 }
    }
    
    public static func -= (lhs: inout [Key : Value], rhs: [Key]) {
        lhs.removeValues(keys: rhs)
    }
    
    public static func + (lhs: [Key : Value], rhs: [Key : Value]) -> [Key : Value] {
        var lhs = lhs
        lhs += rhs
        return lhs
    }
}
