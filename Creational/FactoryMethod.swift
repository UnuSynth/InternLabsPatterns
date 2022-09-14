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

public protocol Creator {
    func createLetter() -> Letter
}

public class LoveLetterCreator: Creator {
    public func createLetter() -> Letter {
        return LoveLetter()
    }
}

public class BusinessLetterCreator: Creator {
    public func createLetter() -> Letter {
        return BusinessLetter()
    }
}

// ---------------------------------------------

public class SomeClientCode {
    public func show(greating: String, creator: Creator) {
        let letter: Letter = creator.createLetter()
        print(greating)
        letter.showMessage()
    }
}

let clientCode: SomeClientCode = .init()

print("------------Love letter------------\n")

clientCode.show(greating: "Hi Amantay,", creator: LoveLetterCreator())

print("\n------------Business letter------------\n")

clientCode.show(greating: "Dear Amantay,\nWe have good news for you:", creator: BusinessLetterCreator())