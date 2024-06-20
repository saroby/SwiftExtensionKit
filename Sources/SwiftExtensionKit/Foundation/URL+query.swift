import Foundation

extension URL {
    
    public static func += (lhs: inout URL, rhs: [String: String]) {
        guard var components = URLComponents(url: lhs, resolvingAgainstBaseURL: false),
              var queryItems = components.queryItems
        else { return }
        
        rhs.forEach { (key, value) in
            if let index = queryItems.firstIndex(where: { $0.name == key }) {
                queryItems[index].value = value
            } else {
                queryItems.append(URLQueryItem(name: key, value: value))
            }
        }
        
        components.queryItems = queryItems
        lhs = components.url!
    }

    public static func -= (lhs: inout URL, rhs: [String]) {
        guard var components = URLComponents(url: lhs, resolvingAgainstBaseURL: false),
              var queryItems = components.queryItems
        else { return }
        
        queryItems.removeAll { item in
            rhs.contains(item.name)
        }
        
        components.queryItems = queryItems
        lhs = components.url!
    }
}
