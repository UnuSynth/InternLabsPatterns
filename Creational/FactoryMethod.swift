public protocol Button {
    func onTap()
}

public class RoundButton: Button {
    public func onTap() {
        print("I am RoundButton instance")
    }
}

public class SquareButton: Button {
    public func onTap() {
        print("I am RoundButton instance")
    }
}

public protocol Creator {
    func createButton() -> Button
}

public class RoundButtonCreator: Creator {
    public func createButton() -> Button {
        return RoundButton()
    }
}

public class SquareButtonCreator: Creator {
    public func createButton() -> Button {
        return SquareButton()
    }
}