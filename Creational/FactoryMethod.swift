// MARK: Letters

public protocol Letter {
    func showMessage()
}

public class LoveLetter: Letter {
    public func showMessage() {
        print("I love you <3")
    }
}

public class BusinessLetter: Letter {
    public func showMessage() {
        print("You are hired!")
    }
}

// ---------------------------------------------
// MARK: - Factories

public protocol Factory {
    func createLetter() -> Letter
}

public class LoveLetterFactory: Factory {
    public func createLetter() -> Letter {
        return LoveLetter()
    }
}

public class BusinessLetterFactory: Factory {
    public func createLetter() -> Letter {
        return BusinessLetter()
    }
}

// ---------------------------------------------
// MARK: - Client Implementation

public class SomeClientCode {
    public func show(greating: String, factory: Factory) {
        let letter: Letter = factory.createLetter()
        print(greating)
        letter.showMessage()
    }
}

let clientCode: SomeClientCode = .init()

print("------------Love letter------------\n")

clientCode.show(greating: "Hi Amantay,", factory: LoveLetterFactory())

print("\n------------Business letter------------\n")

clientCode.show(greating: "Dear Amantay,\nWe have good news for you:", factory: BusinessLetterFactory())