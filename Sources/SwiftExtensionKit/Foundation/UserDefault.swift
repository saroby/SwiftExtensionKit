import Foundation


@propertyWrapper
public struct UserDefault<T> {
    public let key: String
    public let defaultValue: T
    
    public var projectedValue: T {
        return self.defaultValue
    }
    
    public var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: self.key) as? T ?? self.defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: self.key)
        }
    }
}
