#if DEBUG
/// Doesn't compile when going in production.
public func TodoCrash() -> Never {
    fatalError()
}
#endif

#if DEBUG
/// Doesn't compile when going in production.
public func ToDo(_ t: String = "") {
    print("Found todo \(t)")
}
#endif
