public final class Bank: Generator {

    public func name() -> String {
        return generate("bank.name")
    }

    public func swiftBic() -> String {
        return generate("bank.swiftBic")
    }
}
