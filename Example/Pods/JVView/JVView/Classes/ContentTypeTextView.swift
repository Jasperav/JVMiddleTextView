import JVContentType

public struct ContentTypeTextView: ContentType {
    
    public static var allTypes = Set<ContentTypeTextView>()
    
    public var contentTypeId: String?
    public let contentTypeTextFont: ContentTypeTextFont
    
    public init(contentTypeId: String, contentTypeTextFont: ContentTypeTextFont) {
        self.contentTypeId = contentTypeId
        self.contentTypeTextFont = contentTypeTextFont
    }

}
