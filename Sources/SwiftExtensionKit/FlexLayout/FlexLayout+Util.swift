import FlexLayout
import QuartzCore

extension Flex {
    @discardableResult
    public func display(_ value: Bool) -> Flex {
        self.display(value ? .flex : .none)
    }
}

extension Flex {
    @discardableResult
    public func maskedCorners(_ value: CACornerMask) -> Flex {
        if let host = self.view {
            host.layer.maskedCorners = value
            return self
        } else {
            preconditionFailure("Trying to modify deallocated host view")
        }
    }
}
