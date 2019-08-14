import TagRemoverCore

let command = Command()

do {
    try command.run()
} catch {
    print("Error: \(error)")
}
