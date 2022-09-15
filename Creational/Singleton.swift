// MARK: - Singleton

public final class LevelsManager {
    public static let shared: LevelsManager = .init()
    private var levelsDirectory: String
    
    private init() {
        levelsDirectory = "~/Sokoban/Levels"
    }
    
    public func readFile(name: String) -> String {
        // Read level from file here (You should use FileReader here)
        return "Level #\(name):\n\n" + "33333\n31003\n30203\n30403\n33333"
    }
}

// MARK: - Model from MVCSokobanPattern

public class Model {
    private var currentLevel: String?
    
    public func loadLevel(level: String) {
        currentLevel = LevelsManager.shared.readFile(name: level)
    }

    public func printLevel() {
        print(currentLevel ?? "Empty level\n")
    }
}

// MARK: - Client Implementation

let model: Model = .init()
model.printLevel()
model.loadLevel(level: "3")
model.printLevel()