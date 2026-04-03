import Foundation

public protocol Randomable {
    associatedtype Object

    static func random() -> Object
}
