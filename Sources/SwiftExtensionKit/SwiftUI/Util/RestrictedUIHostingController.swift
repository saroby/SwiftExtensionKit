import UIKit
import SwiftUI

// NOTICE: iOS15에서 SwiftUI 네비게이션바가 가려지지 않는 문제가 있어서 특수코드를 집어넣음.
final public class RestrictedUIHostingController<Content>: UIHostingController<Content> where Content: View {
    public override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
}
