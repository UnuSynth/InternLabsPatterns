// MARK: - Some code from another developers

public final class ServerLevelsReader { // Unchangeable code (SDK, Framework)
    public func request(file: String) -> String {
        // Network request here
        return "ServerLevel #\(file):\n\n" + "33333\n31003\n30203\n30403\n33333"
    }
}

public final class LocalLevelsReader { // Unchangeable code (SDK, Framework)
    public func loadLevel(level: String) -> String {
        // Read file here
        return "LocalLevel #\(level):\n\n" + "33333\n30013\n32003\n34003\n33333"
    }
}

// MARK: - Adapter

public protocol LevelLoader {
    func loadLevel(level: String) -> String
}

extension ServerLevelsReader: LevelLoader {
    public func loadLevel(level: String) -> String {
        return request(file: level)
    }
}

extension LocalLevelsReader: LevelLoader { }

// MARK: - Your code

public class Model {
    private var currentMap: String?
    
    public func loadMap(_ mapName: String, using loader: LevelLoader) {
        currentMap = loader.loadLevel(level: mapName)
    }

    public func printMap() {
        print(currentMap ?? "Empty map\n")
    }
}

let model: Model = .init()

model.loadMap("12", using: ServerLevelsReader())
model.printMap()
model.loadMap("3", using: LocalLevelsReader())
model.printMap()