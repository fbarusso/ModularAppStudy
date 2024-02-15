//
//  MovieEntity.swift
//
//
//  Created by MB Labs on 06/02/24.
//

import Foundation

class MovieEntity: Decodable {
    let title: String
    let overview: String
    let posterPath: String

    enum CodingKeys: String, CodingKey {
        case title
        case overview
        case posterPath = "poster_path"
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        title = try container.decode(String.self, forKey: .title)
        overview = try container.decode(String.self, forKey: .overview)
        posterPath = try container.decode(String.self, forKey: .posterPath)
    }
}
