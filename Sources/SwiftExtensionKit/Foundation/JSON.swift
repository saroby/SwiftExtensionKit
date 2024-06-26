import Foundation


public enum JSONError: Error {
    case invalidJSONObject
    case emptyJSONString
}


public protocol JSONStringable {
    func JSONString(options: JSONSerialization.WritingOptions) throws -> String
}


extension JSONStringable {
    
    public func JSONString(options: JSONSerialization.WritingOptions = []) throws -> String  {
        guard JSONSerialization.isValidJSONObject(self) else {
            throw JSONError.invalidJSONObject
        }
        
        let data = try JSONSerialization.data(withJSONObject: self, options: options)
        guard let result = String(data: data, encoding: .utf8) else {
            throw JSONError.emptyJSONString
        }
        
        return result
    }
}

extension Array: JSONStringable {}

extension Dictionary: JSONStringable {}
