import UIKit
import JVView
import JVConstraintEdges
import JVSingleParameterInitializable

open class MiddleTextView: UIView, SingleParameterInitializable {
    
    /// Content type for the label
    public static var contentType: ContentTypeJVLabelText!
    
    private static let constraintEdgesWidth: CGFloat = 5
    private static let spacingFromMiddle: CGFloat = 5
    
    private let normalText: String
    private let loadingText: String?
    private let label: JVLabel
    private let loadingIndicator = UIActivityIndicatorView(style: .gray)
    
    public init(normalText: String, startMode: StartMode? = nil) {
        self.normalText = normalText
        self.loadingText = startMode?.loadingText
        label = JVLabel(contentType: MiddleTextView.contentType)
        
        super.init(frame: CGRect.zero)
        
        addLabel()
        
        if loadingText != nil {
            addLoadingIndicator()
        }
        
        change(mode: startMode?.startMode ?? .normal)
    }
    
    public required convenience init(from: SingleParameterInitializer) {
        self.init(normalText: from.normalText, startMode: from.startMode)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func change(mode: Mode) {
        switch mode {
        case .normal:
            label.text = normalText
            loadingIndicator.stopAnimating()
        case .loading:
            label.text = loadingText!
            loadingIndicator.startAnimating()
        }
    }
    
    private func addLabel() {
        let edges = ConstraintEdges(width: MiddleTextView.constraintEdgesWidth, setHeightToNil: true)
        
        label.fill(toSuperview: self, edges: edges)
        label.topAnchor.constraint(equalTo: centerYAnchor, constant: MiddleTextView.spacingFromMiddle).isActive = true
        label.textAlignment = .center
    }
    
    private func addLoadingIndicator() {
        addSubview(loadingIndicator)
        
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        loadingIndicator.bottomAnchor.constraint(equalTo: centerYAnchor, constant: -MiddleTextView.spacingFromMiddle).isActive = true
    }

}


