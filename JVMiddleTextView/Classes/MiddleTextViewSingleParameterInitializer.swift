public struct MiddleTextViewSingleParameterInitializer {
    let normalText: String
    let startMode: StartMode?
    
    public init(normalText: String, startMode: StartMode? = nil) {
        self.normalText = normalText
        self.startMode = startMode
    }
}
