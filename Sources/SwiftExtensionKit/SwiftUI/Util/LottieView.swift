import SwiftUI
import Lottie
import SnapKit

public struct LottieView: UIViewRepresentable {
    let animationName: String?
    let loopMode: LottieLoopMode
    let url: URL?

    public init(animationName: String, loopMode: LottieLoopMode = .loop) {
        self.animationName = animationName
        self.loopMode = loopMode
        self.url = nil
    }

    public init(url: URL, loopMode: LottieLoopMode = .loop) {
        self.url = url
        self.loopMode = loopMode
        self.animationName = nil
    }

    public func makeUIView(context: Context) -> UIView {
        let container = UIView()
        container.backgroundColor = .clear

        let animationView = LottieAnimationView()
        animationView.loopMode = loopMode
        animationView.contentMode = .scaleAspectFit
        animationView.translatesAutoresizingMaskIntoConstraints = false

        if let animationName {
            animationView.animation = LottieAnimation.named(animationName)
            animationView.play()
        }

        if let url {
            LottieAnimation.loadedFrom(url: url) { animation in
                animationView.animation = animation
                animationView.play()
            }
        }

        container.addSubview(animationView)

        animationView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        return container
    }

    public func updateUIView(_ uiView: UIView, context: Context) {}
}
