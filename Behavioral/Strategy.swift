public class FileReader {
    public init() { }
    
    public func readFile(name: String) -> String {
        return "LocalLevel #\(name):\n\n" + "33333\n31003\n30203\n30403\n33333"
    }
}

public class NetworkProvider {
    public init() { }
    
    public func request(file name: String) -> String {
        return "ServerLevel #\(name):\n\n" + "33333\n30013\n32003\n34003\n33333"
    }
}

public protocol LevelsStrategy {
    func loadMap(name: String) -> String
}

public class LocalLevelsStrategy: LevelsStrategy {
    private let fileReader: FileReader

    public init(fileReader: FileReader = .init()) {
        self.fileReader = fileReader
    }
    
    public func loadMap(name: String) -> String {
        return fileReader.readFile(name: name)
    }
}

public class ServerLevelsStrategy: LevelsStrategy {
    private let networkProvider: NetworkProvider

    public init(networkProvider: NetworkProvider = .init()) {
        self.networkProvider = networkProvider
    }
    
    public func loadMap(name: String) -> String {
        return networkProvider.request(file: name)
    }
}

public class LevelManager {
    private var strategy: LevelsStrategy

    public init(strategy: LevelsStrategy) {
        self.strategy = strategy
    }

    public func setStrategy(_ strategy: LevelsStrategy) {
        self.strategy = strategy
    }

    public func loadMap(name: String) -> String {
        return strategy.loadMap(name: name)
    }
}

public class Model {
    private var currentMap: String?
    private let manager: LevelManager

    public init(manager: LevelManager) {
        self.manager = manager
    }
    
    public func loadMap(_ mapName: String) {
        currentMap = manager.loadMap(name: mapName)
    }

    public func printMap() {
        print(currentMap ?? "Empty map\n")
    }

    public func switchToLocalLevels() {
        manager.setStrategy(LocalLevelsStrategy())
    }

    public func switchToServerLevels() {
        manager.setStrategy(ServerLevelsStrategy())
    }
}

let model: Model = .init(manager: .init(strategy: LocalLevelsStrategy()))
model.loadMap("9")
model.printMap()
model.switchToServerLevels()
model.loadMap("11")
model.printMap()