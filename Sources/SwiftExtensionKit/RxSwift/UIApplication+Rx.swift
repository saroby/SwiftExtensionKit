//#if canImport(UIKit) && canImport(RxSwift) && canImport(RxCocoa)
//import UIKit
//import RxSwift
//
//extension Reactive where Base: UIApplication {
//    
//    public var applicationDidEnterBackground: Observable<Void> {
//        return NotificationCenter.default.rx.notification(UIApplication.didEnterBackgroundNotification).mapToVoid()
//    }
//    
//    public var applicationWillEnterForeground: Observable<Void> {
//        return NotificationCenter.default.rx.notification(UIApplication.willEnterForegroundNotification).mapToVoid()
//    }
//    
//    public var applicationDidFinishLaunchingNotification: Observable<Void> {
//        return NotificationCenter.default.rx.notification(UIApplication.didFinishLaunchingNotification).mapToVoid()
//    }
//    
//    public var applicationDidBecomeActive: Observable<Void> {
//        return NotificationCenter.default.rx.notification(UIApplication.didBecomeActiveNotification).mapToVoid()
//    }
//    
//    public var applicationWillResignActiveNotification: Observable<Void> {
//        return NotificationCenter.default.rx.notification(UIApplication.willResignActiveNotification).mapToVoid()
//    }
//    
//    public var applicationWillTerminateNotification: Observable<Void> {
//        return NotificationCenter.default.rx.notification(UIApplication.willTerminateNotification).mapToVoid()
//    }
//}
//
//#endif
