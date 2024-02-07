//
//  NetworkResponse.swift
//
//
//  Created by MB Labs on 07/02/24.
//

import Foundation

public struct NetworkResponse<T: Decodable>: Decodable {
    public var results: T?
    
    private enum CodingKeys: String, CodingKey {
        case results = "results"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.results = try container.decodeIfPresent(T.self, forKey: .results)
    }
}
