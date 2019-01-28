public extension MiddleTextView {
    struct SingleParameterInitializer {
        public let normalText: String
        public let startMode: StartMode?
        
        public init(normalText: String, startMode: StartMode? = nil) {
            self.normalText = normalText
            self.startMode = startMode
        }
    }
}
