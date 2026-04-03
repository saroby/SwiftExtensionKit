import SwiftUI
import SwiftUIIntrospect

extension View {
    @inlinable nonisolated public func frame(size: CGFloat, alignment: Alignment = .center) -> some View {
        return self.frame(width: size, height: size, alignment: alignment)
    }
}

extension View {
    nonisolated public func onTapGestureAsync(count: Int = 1, perform action: @escaping @Sendable () async -> Void) -> some View {
        self.onTapGesture(count: count) {
            Task {
                await action()
            }
        }
    }
}

extension View {
    @MainActor
    public func scrollIndicatorsHidden() -> some View {
        self.introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17, .v18)) { scrollView in
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.showsVerticalScrollIndicator = false
        }
    }

    @MainActor
    public func scrollBounceDisabled() -> some View {
        self.introspect(.scrollView, on: .iOS(.v13, .v14, .v15, .v16, .v17, .v18)) { scrollView in
            scrollView.bounces = false
        }
    }
}
