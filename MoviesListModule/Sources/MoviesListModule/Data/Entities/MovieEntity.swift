//
//  MovieEntity.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

class MovieEntity: Decodable {
    let originalTitle: String
    let overview: String
    let posterPath: String
    
    enum CodingKeys: String, CodingKey {
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.originalTitle = try container.decode(String.self, forKey: .originalTitle)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.posterPath = try container.decode(String.self, forKey: .posterPath)
    }
}
