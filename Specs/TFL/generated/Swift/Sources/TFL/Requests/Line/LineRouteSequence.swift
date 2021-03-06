//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Line {

    public enum LineRouteSequence {

      public static let service = APIService<Response>(id: "Line_RouteSequence", tag: "Line", method: "GET", path: "/Line/{id}/Route/Sequence/{direction}", hasBody: false)

      /** The direction of travel. Can be inbound or outbound. */
      public enum Direction: String {
          case inbound = "inbound"
          case outbound = "outbound"
          case all = "all"

          public static let cases: [Direction] = [
            .inbound,
            .outbound,
            .all,
          ]
      }

      /** A comma seperated list of service types to filter on. Supported values: Regular, Night. Defaulted to 'Regular' if not specified */
      public enum ServiceTypes: String {
          case regular = "Regular"
          case night = "Night"

          public static let cases: [ServiceTypes] = [
            .regular,
            .night,
          ]
      }

      public class Request: APIRequest<Response> {

          public struct Options {

              /** A single line id e.g. victoria */
              public var id: String

              /** The direction of travel. Can be inbound or outbound. */
              public var direction: Direction

              /** A comma seperated list of service types to filter on. Supported values: Regular, Night. Defaulted to 'Regular' if not specified */
              public var serviceTypes: [ServiceTypes]?

              /** That excludes crowding from line disruptions. Can be true or false. */
              public var excludeCrowding: Bool?

              public init(id: String, direction: Direction, serviceTypes: [ServiceTypes]? = nil, excludeCrowding: Bool? = nil) {
                  self.id = id
                  self.direction = direction
                  self.serviceTypes = serviceTypes
                  self.excludeCrowding = excludeCrowding
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: LineRouteSequence.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(id: String, direction: Direction, serviceTypes: [ServiceTypes]? = nil, excludeCrowding: Bool? = nil) {
              let options = Options(id: id, direction: direction, serviceTypes: serviceTypes, excludeCrowding: excludeCrowding)
              self.init(options: options)
          }

          public override var path: String {
              return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)").replacingOccurrences(of: "{" + "direction" + "}", with: "\(self.options.direction.encode())")
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              if let serviceTypes = options.serviceTypes?.encode() {
                params["serviceTypes"] = serviceTypes
              }
              if let excludeCrowding = options.excludeCrowding {
                params["excludeCrowding"] = excludeCrowding
              }
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = RouteSequence

            /** OK */
            case success200(RouteSequence)

            public var success: RouteSequence? {
                switch self {
                case .success200(let response): return response
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                case .success200(let response): return response
                }
            }

            public var statusCode: Int {
              switch self {
              case .success200: return 200
              }
            }

            public var successful: Bool {
              switch self {
              case .success200: return true
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .success200(JSONDecoder.decode(data: data))
                default: throw APIError.unexpectedStatusCode(statusCode: statusCode, data: data)
                }
            }

            public var description: String {
                return "\(statusCode) \(successful ? "success" : "failure")"
            }

            public var debugDescription: String {
                var string = description
                let responseString = "\(response)"
                if responseString != "()" {
                    string += "\n\(responseString)"
                }
                return string
            }
        }
    }
}
