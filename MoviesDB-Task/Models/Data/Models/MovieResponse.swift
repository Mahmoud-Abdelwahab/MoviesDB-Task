//
//  MovieResponse.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

struct MovieListResponse: Decodable {
    let page: Int
    let results: [MovieResponse]
    let totalPages: Int
    let totalResults: Int
}

struct MovieResponse: Decodable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let posterPath: String
}
