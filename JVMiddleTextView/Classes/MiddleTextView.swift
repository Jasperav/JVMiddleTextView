import UIKit
import JVView
import JVConstraintEdges
import JVDebugProcessorMacros

open class MiddleTextView: UIView {
    
    /// Content type for the label
    public static var contentType: ContentTypeJVLabel!
    
    private static let constraintEdgesWidth: CGFloat = 5
    private static let spacingFromMiddle: CGFloat = 5
    
    public var isQueryable: Bool {
        return queryingText != nil
    }
    
    public var isAnimating: Bool {
        return loadingIndicator.isAnimating
    }
    
    private let notQueryingText: String
    private let queryingText: String?
    private let label: JVLabel
    private let loadingIndicator = UIActivityIndicatorView(style: .gray)
    
    public init(notQueryingText: String, queryingText: String? = nil) {
        self.notQueryingText = notQueryingText
        self.queryingText = queryingText
        label = JVLabel(contentType: MiddleTextView.contentType)
        
        super.init(frame: CGRect.zero)
        
        setupLabel()
        setupLoadingIndicator()
        
        change(mode: queryingText == nil ? .notQuerying : .querying)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        Unsupported()
    }
    
    public func change(mode: Mode) {
        switch mode {
        case .notQuerying:
            label.text = notQueryingText
            loadingIndicator.stopAnimating()
        case .querying:
            label.text = queryingText
            loadingIndicator.startAnimating()
        }
    }

}

extension MiddleTextView: ModelCreator {
    private func setupLabel() {
        let edges = ConstraintEdges(width: MiddleTextView.constraintEdgesWidth, setHeightToNil: true)
        
        label.fill(toSuperview: self, edges: edges)
        
        label.topAnchor.constraint(equalTo: centerYAnchor, constant: MiddleTextView.spacingFromMiddle).isActive = true
        label.textAlignment = .center
    }
    
    private func setupLoadingIndicator() {
        loadingIndicator.addAsSubview(to: self)
        
        loadingIndicator.spacing(from: .bottom, to: .top, view: label, constant: MiddleTextView.spacingFromMiddle)
        
        loadingIndicator.equalToCenterX = self
    }
}
