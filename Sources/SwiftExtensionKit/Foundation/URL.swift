import Foundation

extension URL {
    
    public init?(string: String?) {
        guard let string else { return nil }
        
        self.init(string: string)
    }
}
