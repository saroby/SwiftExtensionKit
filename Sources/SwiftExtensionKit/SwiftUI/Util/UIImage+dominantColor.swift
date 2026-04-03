import SwiftUI
import CoreImage
import CoreImage.CIFilterBuiltins

extension UIImage {
    private static let ciContext = CIContext(options: [.workingColorSpace: kCFNull as Any])

    /// 이미지의 대표 색상을 추출합니다.
    ///
    /// - Warning: 이 메서드는 동기 CPU 연산(`CIContext.render`)을 포함하므로
    ///   메인 스레드에서 직접 호출 시 UI hang이 발생할 수 있습니다.
    ///   반드시 백그라운드에서 호출하고 결과를 메인 스레드에서 적용하세요.
    ///
    /// ```swift
    /// Task.detached(priority: .userInitiated) { [weak self] in
    ///     let color = image?.dominantColor()
    ///     await MainActor.run { [weak self] in
    ///         self?.view.backgroundColor = color.map { UIColor($0) }
    ///     }
    /// }
    /// ```
    public func dominantColor() -> Color? {
        guard let cgImage = self.cgImage,
              cgImage.width > 0,
              cgImage.height > 0 else { return nil }

        let inputImage = CIImage(cgImage: cgImage)
        guard !inputImage.extent.isEmpty else { return nil }

        let extent = inputImage.extent
        guard !extent.isNull, !extent.isInfinite, extent.width > 0, extent.height > 0 else {
            return nil
        }

        let maxDimension: CGFloat = 100
        let scaledImage: CIImage
        if extent.width > maxDimension || extent.height > maxDimension {
            let scale = min(maxDimension / extent.width, maxDimension / extent.height)
            scaledImage = inputImage.transformed(by: CGAffineTransform(scaleX: scale, y: scale))
        } else {
            scaledImage = inputImage
        }

        let filter = CIFilter.areaAverage()
        filter.inputImage = scaledImage
        filter.extent = scaledImage.extent

        guard let outputImage = filter.outputImage else { return nil }

        var bitmap = [UInt8](repeating: 0, count: 4)

        Self.ciContext.render(
            outputImage,
            toBitmap: &bitmap,
            rowBytes: 4,
            bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
            format: .RGBA8,
            colorSpace: nil
        )

        return Color(
            red: CGFloat(bitmap[0]) / 255.0,
            green: CGFloat(bitmap[1]) / 255.0,
            blue: CGFloat(bitmap[2]) / 255.0,
            opacity: CGFloat(bitmap[3]) / 255.0
        )
    }
}
