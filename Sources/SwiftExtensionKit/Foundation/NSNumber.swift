import Foundation

protocol NSNumberConvertible {
    func toNSNumber() -> NSNumber
}

extension Int: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Int8: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Int16: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Int32: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Int64: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Float: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Double: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension Bool: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension UInt: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension UInt8: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}


extension UInt16: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension UInt32: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}

extension UInt64: NSNumberConvertible {
    
    public func toNSNumber() -> NSNumber {
        return self as NSNumber
    }
}
