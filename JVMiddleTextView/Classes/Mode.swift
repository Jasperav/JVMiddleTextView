public enum Mode {
    case normal, loading
}

public struct StartMode {
    public let loadingText: String
    public let startMode: Mode
    
    public init(loadingText: String, startMode: Mode) {
        self.loadingText = loadingText
        self.startMode = startMode
    }
}
