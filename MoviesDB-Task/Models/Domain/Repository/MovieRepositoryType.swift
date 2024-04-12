//
//  MovieRepositoryType.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

///  ` If caching needed we can  add Local Data Source in the future here
///
protocol MovieRepositoryType {
    func fetchTrendingMovies() async throws -> MovieListResponse
    func fetchMovieDetails(movieId: String) async throws -> MovieResponse
}
