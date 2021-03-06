//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.StopPoint {

    public enum StopPointGetByMode {

      public static let service = APIService<Response>(id: "StopPoint_GetByMode", tag: "StopPoint", method: "GET", path: "/StopPoint/Mode/{modes}", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              /** A comma-seperated list of modes e.g. tube,dlr */
              public var modes: [String]

              /** The data set page to return. Page 1 equates to the first 1000 stop points, page 2 equates to 1001-2000 etc. Must be entered for bus mode as data set is too large. */
              public var page: Int?

              public init(modes: [String], page: Int? = nil) {
                  self.modes = modes
                  self.page = page
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: StopPointGetByMode.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(modes: [String], page: Int? = nil) {
              let options = Options(modes: modes, page: page)
              self.init(options: options)
          }

          public override var path: String {
              return super.path.replacingOccurrences(of: "{" + "modes" + "}", with: "\(self.options.modes)")
          }

          public override var parameters: [String: Any] {
              var params: JSONDictionary = [:]
              if let page = options.page {
                params["page"] = page
              }
              return params
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = StopPointsResponse

            /** OK */
            case success200(StopPointsResponse)

            public var success: StopPointsResponse? {
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
