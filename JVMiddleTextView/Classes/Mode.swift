public enum Mode {
    case normal, loading
}

public struct StartMode {
    let loadingText: String
    let startMode: Mode
    
    public init(loadingText: String, startMode: Mode) {
        self.loadingText = loadingText
        self.startMode = startMode
    }
}
