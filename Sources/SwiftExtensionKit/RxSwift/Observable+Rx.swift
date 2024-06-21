#if canImport(RxSwift)
import RxSwift

extension Observable {
    
    public func mapToVoid() -> Observable<Void> { self.map { _ in } }
    
    public func mapToString() -> Observable<String> { self.map { "\($0)" } }
    
    public func mapTo<T>(_ value: T) -> Observable<T> { self.map { _ in value } }
}

extension Observable<Bool> {
    
    public func toggle() -> Observable<Bool> {
        return self.map { !$0 }
    }
}
#endif
