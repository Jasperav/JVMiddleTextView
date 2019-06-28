/// Only final classes/structs can adopt this protocol
public protocol ContentType: Hashable {
    
    /// All reusable content types should be in here with a non-nil id.
    static var allTypes: Set<Self> { get set }
    
    //    /// Getting a reusable content type
    //    static func getContentType(contentTypeId: String) -> Self
    
    /// For base/reusable content types, the id is filled.
    /// Those content types should be in allTypes with a non-nil id.
    var contentTypeId: String? { get set }
    
    /// Optional overridable method to add extra checks
    /// However, the default method should be sufficient, and should always be called.
    /// This is because allTypes is a Set, and if the default method fails, it never gets added.
    func addToAllTypes()
}

public extension ContentType {
    
    /// Adds the reusabele to the Set of content types.
    func addToAllTypes<T: RawRepresentable>(contentTypeId: T) where T.RawValue == String {
        var copy = self
        copy.contentTypeId = contentTypeId.rawValue
        
        assert(!Self.allTypes.contains(copy))
        
        Self.allTypes.insert(copy)
    }
    
    /// Adds the reusabele to the Set of content types.
    @available(*, deprecated, message: "Use the method with generic type T")
    func addToAllTypes() {
        assert(!Self.allTypes.contains(self))
        
        Self.allTypes.insert(self)
    }
    
    /// Getting the associated content type.
    /// If it isn't present, if will trigger a runtime error.
    /// To prevent this, make it more typesafe and do not reuse literal expressions
    /// but e.g. an enum.
    static func getContentType(contentTypeId: String) -> Self {
        return Self.allTypes.first(where: { $0.contentTypeId == contentTypeId })!
    }
    
    /// The contentTypeId makes the contentType unique.
    func hash(into hasher: inout Hasher) {
        hasher.combine(contentTypeId!)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.contentTypeId! == rhs.contentTypeId!
    }
    
    init(old: Self, newContentTypeId: String? = nil) {
        self = old
        contentTypeId = newContentTypeId
        #if DEBUG
        validateIsStruct(self)
        #endif
    }
    
    func copy(newContentTypeId: String? = nil) -> Self {
        return Self.init(old: self, newContentTypeId: newContentTypeId)
    }
}

#if DEBUG
func validateIsStruct(_ obj: Any) {
    let mirror = Mirror(reflecting: obj)
    guard mirror.displayStyle == .struct else { fatalError("Call the other copy.") }
}
#endif
