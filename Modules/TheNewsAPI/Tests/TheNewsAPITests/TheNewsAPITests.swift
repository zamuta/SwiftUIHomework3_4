import XCTest
@testable import TheNewsAPI

final class TheNewsAPITests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TheNewsAPI().text, "Hello, World!")
    }
}
