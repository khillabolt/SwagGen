//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class EnumClass: JSONDecodable, JSONEncodable, PrettyPrintable {

    public init() {
    }

    public required init(jsonDictionary: JSONDictionary) throws {
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
