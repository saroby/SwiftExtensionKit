#if canImport(RxSwift) && canImport(RxCocoa) && canImport(UIKit)
import UIKit
import RxSwift
import RxCocoa


extension RxSwift.Reactive where Base: UIView {

    public var layoutSubviews: Observable<Void> {
        return methodInvoked(#selector(UIView.layoutSubviews))
            .mapToVoid()
    }
}
#endif
