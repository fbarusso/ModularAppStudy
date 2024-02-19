//
//  Network.swift
//
//
//  Created by MB Labs on 05/02/24.
//

import Alamofire
import Foundation

public class Network {
    public static let sharedInstance = Network()

    private static let networkResponseParseError = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: "Ocorreu um erro inesperado."])

    private var alamofireManager: Alamofire.Session

    private init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20
        configuration.timeoutIntervalForResource = 20

        alamofireManager = Alamofire.Session(configuration: configuration)
    }

    public func request<T: Decodable>(
        responseType _: T.Type,
        path: String,
        method: HTTPMethod = .get,
        headers: [String: String]? = nil,
        parameters: [String: String]? = nil,
        completion: @escaping (_ result: Result<T, NSError>) -> Void
    ) {
        let headers = headers ?? createDefaultHeaders()
        let url = (NetworkConstants.baseURL + path)

        AF.request(
            url,
            method: method,
            parameters: parameters,
            headers: HTTPHeaders(headers)
        ).responseDecodable(of: NetworkResponse<T>.self) { response in
            self.logRequest(request: response.request)
            switch response.result {
            case let .success(data):
                if let data = data.results {
                    completion(.success(data))
                } else {
                    completion(.failure(Network.networkResponseParseError))
                }
            case let .failure(error):
                completion(.failure(error as NSError))
            }
        }
    }

    private func createDefaultHeaders() -> [String: String] {
        let headers = [
            "Content-Type": "application/json",
            "Authorization": NetworkConstants.apiKey,
        ]

        return headers
    }

    private func logRequest(request: URLRequest?) {
        var log = "Request\n"
        log.append("Method: \(request?.httpMethod ?? "Error")\n")
        log.append("URL: \(request?.url?.absoluteString ?? "Error")\n")
        log.append("Headers: \(String(describing: request?.headers.dictionary))\n")
        print(log)
    }
}
