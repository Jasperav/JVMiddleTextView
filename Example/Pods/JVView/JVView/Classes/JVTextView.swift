import UIKit
import JVDebugProcessorMacros

open class JVTextView: UITextView {
    
    private let contentType: ContentTypeTextView
    
    public init(contentType: ContentTypeTextView, textContainer: NSTextContainer? = nil) {
        self.contentType = contentType
        
        super.init(frame: CGRect.zero, textContainer: textContainer)
        
        setupContentType()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        Unsupported()
    }
    
    private func setupContentType() {
        font = contentType.contentTypeTextFont.font
    }
    
}
