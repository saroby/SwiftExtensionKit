#if canImport(WebKit) && canImport(RxCocoa) && canImport(UIKit)
import WebKit
import RxSwift
import RxCocoa

extension RxSwift.Reactive where Base: WKWebView {
    
    public var title: Observable<String?> {
        return self
            .observe(String.self, #keyPath(WKWebView.title))
    }
    
    public var url: Observable<URL?> {
        return self
            .observe(URL.self, #keyPath(WKWebView.url))
    }
    
    public var isLoading: Observable<Bool> {
        return self
            .observe(Bool.self, #keyPath(WKWebView.isLoading))
            .map { $0 ?? false }
    }
    
    public var estimatedProgress: Observable<Double> {
        return self
            .observe(Double.self, #keyPath(WKWebView.estimatedProgress))
            .map { $0 ?? .zero }
    }
    
    public var canGoBack: Observable<Bool> {
        return self
            .observe(Bool.self, #keyPath(WKWebView.canGoBack))
            .map { $0 ?? false }
    }
    
    public var canGoForward: Observable<Bool> {
        return self
            .observe(Bool.self, #keyPath(WKWebView.canGoForward))
            .map { $0 ?? false }
    }
}
#endif
