//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension TFL.Occupancy {

    public enum GetOccupant {

      public static let service = APIService<Response>(id: "getOccupant", tag: "Occupancy", method: "GET", path: "/Occupancy/CarPark/{id}", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              public var id: String

              public init(id: String) {
                  self.id = id
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: GetOccupant.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(id: String) {
              let options = Options(id: id)
              self.init(options: options)
          }

          public override var path: String {
              return super.path.replacingOccurrences(of: "{" + "id" + "}", with: "\(self.options.id)")
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = CarParkOccupancy

            /** OK */
            case success200(CarParkOccupancy)

            public var success: CarParkOccupancy? {
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
