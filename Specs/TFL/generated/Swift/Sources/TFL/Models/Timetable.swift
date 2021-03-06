//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

public class Timetable: JSONDecodable, JSONEncodable, PrettyPrintable {

    public var departureStopId: String?

    public var routes: [TimetableRoute]?

    public init(departureStopId: String? = nil, routes: [TimetableRoute]? = nil) {
        self.departureStopId = departureStopId
        self.routes = routes
    }

    public required init(jsonDictionary: JSONDictionary) throws {
        departureStopId = jsonDictionary.json(atKeyPath: "departureStopId")
        routes = jsonDictionary.json(atKeyPath: "routes")
    }

    public func encode() -> JSONDictionary {
        var dictionary: JSONDictionary = [:]
        if let departureStopId = departureStopId {
            dictionary["departureStopId"] = departureStopId
        }
        if let routes = routes?.encode() {
            dictionary["routes"] = routes
        }
        return dictionary
    }

    /// pretty prints all properties including nested models
    public var prettyPrinted: String {
        return "\(type(of: self)):\n\(encode().recursivePrint(indentIndex: 1))"
    }
}
