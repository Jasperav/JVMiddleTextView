import UIKit
import JVView
import JVConstraintEdges

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
        
        addLabel()
        addLoadingIndicator()
        
        change(mode: queryingText == nil ? .notQuerying : .querying)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

    private func addLabel() {
        let edges = ConstraintEdges(width: MiddleTextView.constraintEdgesWidth, setHeightToNil: true)
        
        label.layout {
            $0.fill(toSuperview: self, edges: edges)
            
            $0.topAnchor.constraint(equalTo: centerYAnchor, constant: MiddleTextView.spacingFromMiddle).isActive = true
        }
        
        label.textAlignment = .center
    }
    
    private func addLoadingIndicator() {
        loadingIndicator.layout {
            $0.addAsSubview(to: self)
            
            $0.spacing(from: .bottom, to: .top, view: label, constant: MiddleTextView.spacingFromMiddle)
            
            $0.equalToCenterX = self
        }
    }

}


