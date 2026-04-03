import Foundation

extension Collection where Element: Equatable {
    public func element(after element: Element) -> Element? {
        guard let index = firstIndex(of: element) else { return nil }

        let nextIndex = self.index(after: index)
        return nextIndex < endIndex ? self[nextIndex] : nil
    }
}
