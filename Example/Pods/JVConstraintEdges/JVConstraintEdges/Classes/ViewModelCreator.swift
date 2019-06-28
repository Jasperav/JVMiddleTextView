import UIKit

open class ViewModelCreator {
    private unowned let view: UIView
    private unowned let middleView: UIView
    
    // TODO: Change this to unowned if swift 5.0 is supported.
    private weak var leadingView: UIView?
    private weak var trailingView: UIView?
    private let edges: ConstraintEdges
    
    private init(view: UIView,
                 middleView: UIView,
                 leadingView: UIView? = nil,
                 trailingView: UIView? = nil,
                 edges: ConstraintEdges = .zero) {
        self.view = view
        self.middleView = middleView
        self.leadingView = leadingView
        self.trailingView = trailingView
        self.edges = edges
    }
    
    public static func createStackView(leadingView: UIView?, middleView: UIView, trailingView: UIView?) -> UIStackView {
        let stackView = UIStackView(frame: .zero)
        
        stackView.spacing = 5
        
        addArrangedSubview(stackView: stackView, contentHugging: 251, view: leadingView)
        addArrangedSubview(stackView: stackView, contentHugging: 250, view: middleView)
        addArrangedSubview(stackView: stackView, contentHugging: 251, view: trailingView)
        
        return stackView
    }
    
    private static func addArrangedSubview(stackView: UIStackView, contentHugging: Float, view: UIView?) {
        guard let view = view else { return }
        
        view.layout(contentHugging: contentHugging)
        
        stackView.addArrangedSubview(view)
    }
    
    public static func layout(view: UIView,
                              middleView: UIView,
                              leadingView: UIView? = nil,
                              trailingView: UIView? = nil,
                              edges: ConstraintEdges = .zero) {
        ViewModelCreator(view: view, middleView: middleView, leadingView: leadingView, trailingView: trailingView, edges: edges).create()
    }
    
    private func create() {
        if leadingView == nil && trailingView == nil {
            // No stackview will be used.
            middleView.layout(in: view, edges: edges)
            
            return
        }
        
        let stackView = ViewModelCreator.createStackView(leadingView: leadingView, middleView: middleView, trailingView: trailingView)
        
        stackView.layout(in: view, edges: edges)
    }
}
