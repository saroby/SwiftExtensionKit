import XCTest
@testable import SwiftExtensionKit

final class SwiftExtensionKitTests: XCTestCase {
    
    func urlQueryAppendTest(_ url: URL) {
        var url = url
        url += ["d": 1.description]
        XCTAssert(url == URL(string: "http://blog/@saroby?a=100&b=dummy&c=abc&d=1"))
    }
    
    func urlQueryRemoveTest(_ url: URL) {
        var url = url
        url -= ["a", "b", "c", "d"]
        XCTAssert(url == URL(string: "http://blog/@saroby"))
    }
    
    
    func testExample() throws {
        guard var url = URL(string: "http://blog/@saroby?a=100&b=dummy&c=abc") else {
            XCTFail()
            return
        }
        
        urlQueryAppendTest(url)
        
        urlQueryRemoveTest(url)
    }
}
