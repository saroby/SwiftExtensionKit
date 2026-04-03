import SwiftUI

// NOTICE: iOS16부터 AnyShape가 공식으 로제공된다. 버전업 이후에 제거 요망
public struct AnyShape: Shape {
    private let _path: (CGRect) -> Path

    public init<S: Shape>(_ shape: S) {
        _path = shape.path(in:)
    }

    public func path(in rect: CGRect) -> Path {
        _path(rect)
    }
}
