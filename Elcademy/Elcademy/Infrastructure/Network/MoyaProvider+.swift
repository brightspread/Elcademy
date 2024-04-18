//
//  MoyaProvider+.swift
//  Elcademy
//
//  Created by Leo on 4/17/24.
//

import Foundation
import Moya
import Combine
import CombineMoya

extension MoyaProvider {
    func request<R>(target: Target,
                    callbackQueue: DispatchQueue? = nil) -> AnyPublisher<R?, NetworkError> where R: Decodable {
        return requestPublisher(target, callbackQueue: callbackQueue)
            .retry(3)
            .log {
                """
                =====================================
                [API] method: \(target.method.rawValue)
                [API] url: \($0.request?.url?.absoluteString ?? "no url")
                [API] task: \(target.task)
                [API] statusCode: \($0.statusCode)
                [API] response: \($0.data.prettyPrintedJSONString))
                =====================================
                """
            }
            .eraseToAnyPublisher()
            .filterSuccessfulStatusAndRedirectCodes()
            .map(R.self,
                 failsOnEmptyData: true)
            .mapToNilable()
            .mapErrorAsNetwork()
            .eraseToAnyPublisher()
    }
}

extension Publisher {
    @inlinable func log(_ output: @escaping (Self.Output) -> String) -> AnyPublisher<Self.Output, Self.Failure> {
        self.handleEvents(receiveOutput: {
            Swift.print(output($0))
        })
        .eraseToAnyPublisher()
    }
    
    func mapErrorAsNetwork() -> Publishers.MapError<Self, NetworkError> {
        self.mapError {
            if let network = $0 as? NetworkError {
                return network
            }
            return .unknown(error: $0)
        }
    }
}

extension Publisher where Self.Failure == MoyaError {
    @inlinable func mapToNilable() -> Publishers.Map<Self, Self.Output?> {
        self.map { $0 }
    }
}

fileprivate extension Data {
    var prettyPrintedJSONString: String {
        guard let object = try? JSONSerialization.jsonObject(with: self, options: []),
              let data = try? JSONSerialization.data(withJSONObject: object, options: [.prettyPrinted]),
              let prettyPrintedString = String(data: data, encoding: .utf8) else {
            return String(data: self, encoding: .utf8) ?? "no data"
        }

        return prettyPrintedString
    }
}
