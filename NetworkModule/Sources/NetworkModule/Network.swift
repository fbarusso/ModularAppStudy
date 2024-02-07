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
    
    var alamofireManager: Alamofire.Session
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 20// seconds
        configuration.timeoutIntervalForResource = 20
        
        alamofireManager = Alamofire.Session(configuration: configuration)
    }
    
    public func request<Parameters: Encodable>(
        path: String,
        requestType: HTTPMethod,
        headers: [String: String]? = nil,
        requestParameters: Parameters?,
        completion: @escaping (_ response: HTTPURLResponse?, _ data: Data?, _ error: Error?) -> Void
    ) {
        guard let headers = headers ?? createDefaultHeaders() else { return }
        let url = ("https://api.themoviedb.org/3" + path)

        AF.request(
            url,
            method: requestType,
            parameters: requestParameters,
            encoder: JSONParameterEncoder.default,
            headers: HTTPHeaders(headers)
        ).response { dataResponse in
            completion(dataResponse.response, dataResponse.data, dataResponse.error)
        }
    }

    private func createDefaultHeaders() -> [String: String]? {
        var headers = [
            "Content-Type": "application/json",
            "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI1YzllMTQxNGEzNTc3ZDZkZWI1ODdlOGVlY2VkM2M0NCIsInN1YiI6IjY1YzI3ZGRiOTY1M2Y2MDE2MmVjZDk5MSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.6dup4MsKnOLBk-9dmx5x4tPEijMB9T2Ca_7isgUfvrQ"
        ]

        return headers
    }
}
