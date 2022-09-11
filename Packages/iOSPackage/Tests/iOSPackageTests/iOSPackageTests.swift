import XCTest
@testable import iOSManagers

final class iOSPackageTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MotionManager().startStream(), "hello")
    }
}
