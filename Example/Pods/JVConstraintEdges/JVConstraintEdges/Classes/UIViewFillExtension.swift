import UIKit
import JVDebugProcessorMacros

public extension UIView {
    
    func layoutSquare() {
        heightAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    func layoutEqual(size: UIView) {
        heightAnchor.constraint(equalTo: size.heightAnchor).isActive = true
        widthAnchor.constraint(equalTo: size.widthAnchor).isActive = true
    }
    
    func layoutEqual(centerX: UIView) {
        centerXAnchor.constraint(equalTo: centerX.centerXAnchor).isActive = true
    }
    
    func layoutEqual(centerY: UIView) {
        centerYAnchor.constraint(equalTo: centerY.centerYAnchor).isActive = true
    }
    
    func layoutConstant(height: CGFloat) {
        heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func layoutConstant(width: CGFloat) {
        widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func layout(contentHugging: Float) {
        setContentHuggingPriority(UILayoutPriority(rawValue: contentHugging), for: .horizontal)
        setContentHuggingPriority(UILayoutPriority(rawValue: contentHugging), for: .vertical)
    }
    
    func layout(compressionResistance: Float) {
        setContentCompressionResistancePriority(UILayoutPriority(rawValue: compressionResistance), for: .horizontal)
        setContentCompressionResistancePriority(UILayoutPriority(rawValue: compressionResistance), for: .vertical)
    }
    
    func layout(contentHuggingAndCompressionResistance: Float) {
        layout(contentHugging: contentHuggingAndCompressionResistance)
        layout(compressionResistance: contentHuggingAndCompressionResistance)
    }
    
    func layoutEqualWidth(view: UIView, constant: CGFloat = 0) {
        widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1, constant: constant).isActive = true
    }
    
    func layoutEqualHeight(view: UIView, constant: CGFloat = 0) {
        heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 1, constant: constant).isActive = true
    }
    
    func layoutInMiddle(inView superview: UIView, addToSuperView: Bool = true, toSafeMargins: Bool = false) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if addToSuperView{
            superview.addSubview(self)
        }
        
        NSLayoutConstraint.activate([
            NSLayoutConstraint(item: self,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: superview,
                               attribute: .centerX,
                               multiplier: 1,
                               constant: 0),
            NSLayoutConstraint(item: self,
                               attribute: .centerY,
                               relatedBy: .equal,
                               toItem: superview,
                               attribute: .centerY,
                               multiplier: 1,
                               constant: 0)
            ])
    }
    
    func layout(edges: ConstraintEdges? = nil, addToSuperView: Bool = true, toSafeMargins: Bool = false) -> UIView {
        let view = UIView()
        
        layout(in: view, edges: edges, addToSuperView: addToSuperView, toSafeMargins: toSafeMargins)
        
        return view
    }
    
    func layout(in view: UIView, edges: ConstraintEdges? = nil, addToSuperView: Bool = true, toSafeMargins: Bool = false) {
        let edgesToUse = edges ?? ConstraintEdges.zero
        let safeGuide = view.safeAreaLayoutGuide
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if addToSuperView{
            view.addSubview(self)
        }
        
        if let bottom = edgesToUse.bottom {
            if toSafeMargins {
                bottomAnchor.constraint(equalTo: safeGuide.bottomAnchor, constant: -bottom).isActive = true
            } else {
                bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -bottom).isActive = true
            }
        }
        
        if let top = edgesToUse.top {
            if toSafeMargins {
                topAnchor.constraint(equalTo: safeGuide.topAnchor, constant: top).isActive = true
            } else {
                topAnchor.constraint(equalTo: view.topAnchor, constant: top).isActive = true
            }
        }
        
        if let leading = edgesToUse.leading {
            if toSafeMargins {
                leadingAnchor.constraint(equalTo: safeGuide.leadingAnchor, constant: leading).isActive = true
            } else {
                leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leading).isActive = true
            }
        }
        
        if let trailing = edgesToUse.trailing {
            if toSafeMargins {
                trailingAnchor.constraint(equalTo: safeGuide.trailingAnchor, constant: -trailing).isActive = true
            } else {
                trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -trailing).isActive = true
            }
        }
    }
    
    func addAsSubview(to: UIView) {
        assert(superview == nil)
        to.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    // https://blog.kulman.sk/filling-uitableview-from-bottom-top/
    func flip() {
        transform = CGAffineTransform(scaleX: 1, y: -1)
    }
    
    func flip(ifFlipped flipped: Bool) {
        if flipped {
            flip()
        }
    }
    
    func layoutEqual(view: UIView, edges: ConstraintEdges) {
        layout(in: view, edges: edges, addToSuperView: false)
    }
    
    func layoutEqual(view: UIView, edge: UIRectEdge) {
        assert(edge != .all)
        
        layoutEqual(view: view, edges: ConstraintEdges(rectEdge: edge))
    }
    
    func layoutAnchor(from: AnchorX, to: NSLayoutYAxisAnchor, constant: CGFloat = 0) {
        switch from {
        case .top:
            topAnchor.constraint(equalTo: to, constant: constant).isActive = true
        case .bottom:
            bottomAnchor.constraint(equalTo: to, constant: constant).isActive = true
        }
    }
    
    func layoutAnchor(from: AnchorY, to: NSLayoutXAxisAnchor, constant: CGFloat = 0) {
        switch from {
        case .left:
            leadingAnchor.constraint(equalTo: to, constant: constant).isActive = true
        case .right:
            trailingAnchor.constraint(equalTo: to, constant: constant).isActive = true
        }
    }
    
}
