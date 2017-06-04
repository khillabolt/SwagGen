//
// Generated by SwagGen
// https://github.com/yonaskolb/SwagGen
//

import Foundation
import JSONUtilities

extension PetstoreTest.Store {

    /** For valid response try integer IDs with value <= 5 or > 10. Other values will generated exceptions */
    public enum GetOrderById {

      public static let service = APIService<Response>(id: "getOrderById", tag: "store", method: "GET", path: "/store/order/{order_id}", hasBody: false)

      public class Request: APIRequest<Response> {

          public struct Options {

              /** ID of pet that needs to be fetched */
              public var orderId: Int

              public init(orderId: Int) {
                  self.orderId = orderId
              }
          }

          public var options: Options

          public init(options: Options) {
              self.options = options
              super.init(service: GetOrderById.service)
          }

          /// convenience initialiser so an Option doesn't have to be created
          public convenience init(orderId: Int) {
              let options = Options(orderId: orderId)
              self.init(options: options)
          }

          public override var path: String {
              return super.path.replacingOccurrences(of: "{" + "orderId" + "}", with: "\(self.options.orderId)")
          }
        }

        public enum Response: APIResponseValue, CustomStringConvertible, CustomDebugStringConvertible {
            public typealias SuccessType = Order

            /** successful operation */
            case success200(Order)

            /** Invalid ID supplied */
            case failure400

            /** Order not found */
            case failure404

            public var success: Order? {
                switch self {
                case .success200(let response): return response
                default: return nil
                }
            }

            public var response: Any {
                switch self {
                case .success200(let response): return response
                default: return ()
                }
            }

            public var statusCode: Int {
              switch self {
              case .success200: return 200
              case .failure400: return 400
              case .failure404: return 404
              }
            }

            public var successful: Bool {
              switch self {
              case .success200: return true
              case .failure400: return false
              case .failure404: return false
              }
            }

            public init(statusCode: Int, data: Data) throws {
                switch statusCode {
                case 200: self = try .success200(JSONDecoder.decode(data: data))
                case 400: self = .failure400
                case 404: self = .failure404
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