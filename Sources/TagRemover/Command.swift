import Foundation
import TagRemoverCore

public final class Command {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() throws {
        guard arguments.count > 1 else {
            throw Error.missingInput
        }
        try TagRemover.removeTag(htmlOrPath: arguments[1])
    }
}

public extension Command {
    enum Error: Swift.Error {
        case missingInput
    }
}
