import UIKit
import JVView
import JVConstraintEdges
import JVDebugProcessorMacros

open class MiddleTextView: UIView {
    
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
    private let label = UILabel() // Use text setup initalizer
    private let loadingIndicator = UIActivityIndicatorView(style: .medium)
    
    public init(notQueryingText: String, queryingText: String? = nil) {
        self.notQueryingText = notQueryingText
        self.queryingText = queryingText
        
        super.init(frame: CGRect.zero)
        
        layoutLabel()
        layoutLoadingIndicator()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    public func change(mode: Mode, customText: String? = nil) {
        switch mode {
        case .notQuerying:
            label.text = customText ?? notQueryingText
            loadingIndicator.stopAnimating()
        case .querying:
            label.text = customText ?? queryingText
            loadingIndicator.startAnimating()
        }
    }
    
}

extension MiddleTextView: ViewLayout {
    private func layoutLabel() {
        let edges = ConstraintEdges(width: MiddleTextView.constraintEdgesWidth, setHeightToNil: true)
        
        label.layout(in: self, edges: edges)
        
        label.topAnchor.constraint(equalTo: centerYAnchor, constant: MiddleTextView.spacingFromMiddle).isActive = true
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = .preferredFont(forTextStyle: .headline)
    }
    
    private func layoutLoadingIndicator() {
        loadingIndicator.addAsSubview(to: self)
        
        loadingIndicator.layoutAnchor(from: .bottom, to: label.topAnchor, constant: -MiddleTextView.spacingFromMiddle)
        
        loadingIndicator.layoutEqual(centerX: self)
    }
}
