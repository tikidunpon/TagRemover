import XCTest
import class Foundation.Bundle
import TagRemoverCore

final class TagRemoverTests: XCTestCase {
    
    func testRemoveTag() {
        let actual = TagRemover.removeTag(htmlOrPath: "<h3>This is <strong>awesome</strong> sample html</h3>")
        XCTAssertEqual(actual, "This is awesome sample html")
    }
    
    func testExample() throws {
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.

        // Some of the APIs that we use below are available in macOS 10.13 and above.
        guard #available(macOS 10.13, *) else {
            return
        }
        
        let fooBinary = productsDirectory.appendingPathComponent("TagRemover")

        let process = Process()
        process.executableURL = fooBinary

        let pipe = Pipe()
        process.standardOutput = pipe

        process.arguments = ["<h3>This is <strong>awesome</strong> sample html</h3>"]
        try process.run()
        process.waitUntilExit()

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8)

        XCTAssertEqual(output!, "This is awesome sample html\n")
    }

    /// Returns path to the built products directory.
    var productsDirectory: URL {
      #if os(macOS)
        for bundle in Bundle.allBundles where bundle.bundlePath.hasSuffix(".xctest") {
            return bundle.bundleURL.deletingLastPathComponent()
        }
        fatalError("couldn't find the products directory")
      #else
        return Bundle.main.bundleURL
      #endif
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
