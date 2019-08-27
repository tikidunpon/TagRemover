import Foundation
import TagRemoverCore

public final class Command {
    private let arguments: [String]
    
    public init(arguments: [String] = CommandLine.arguments) {
        self.arguments = arguments
    }
    
    public func run() {
        guard arguments.count > 1 else {
            print("error: missing input")
            return
        }
        if let text = TagRemover.removeTag(htmlOrPath: arguments[1]) {
            print(text)
        }
    }
}
