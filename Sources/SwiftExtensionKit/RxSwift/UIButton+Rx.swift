#if canImport(RxSwift) && canImport(RxCocoa) && canImport(UIKit)
import UIKit
import RxSwift
import RxCocoa


extension RxSwift.Reactive where Base: UIButton {
    
    public var isSelectedObservable: Observable<Bool> {
        return self
            .observe(\.isSelected)
    }
}

#endif
