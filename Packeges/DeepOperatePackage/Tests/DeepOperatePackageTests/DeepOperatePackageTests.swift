import XCTest
@testable import Managers

final class DeepOperatePackageTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(MotionManager().startStream(), "hello")
    }
}