import SwiftUI

@propertyWrapper
public struct AppStorageStringBool: DynamicProperty {
    @AppStorage var storage: String

    public var wrappedValue: Binding<Bool> {
        Binding(
            get: { storage == "YES" },
            set: { storage = $0 ? "YES" : "NO" }
        )
    }

    public init(_ key: String, store: UserDefaults = .standard) {
        self._storage = AppStorage(wrappedValue: "NO", key, store: store)
    }
}
