#if canImport(RxSwift) && canImport(RxCocoa) && canImport(UIKit)
import UIKit
import RxSwift
import RxCocoa

extension RxSwift.Reactive where Base: UIViewController {
    
    public var viewDidLoad: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLoad))
            .mapToVoid()
    }
    
    public var viewWillAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillAppear))
            .map { $0.first as? Bool ?? false }
    }
    
    public var viewDidAppear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidAppear))
            .map { $0.first as? Bool ?? false }
    }
    
    public var viewWillDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewWillDisappear))
            .map { $0.first as? Bool ?? false }
    }
    
    public var viewDidDisappear: Observable<Bool> {
        return methodInvoked(#selector(UIViewController.viewDidDisappear))
            .map { $0.first as? Bool ?? false }
    }
    
    public var viewWillLayoutSubviews: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewWillLayoutSubviews))
            .mapToVoid()
    }
    
    public var viewDidLayoutSubviews: Observable<Void> {
        return methodInvoked(#selector(UIViewController.viewDidLayoutSubviews))
            .mapToVoid()
    }
}

#endif
