//
//  MovieRepository.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation


///  ` If caching needed we can add Local Data Source in the future here
///
class MovieRepository: MovieRepositoryType {
    
    private let remoteDataSource: RemoteDataSourceType
    
    init(
        remoteDataSource: RemoteDataSourceType = RemoteDataSource()
    ){
        self.remoteDataSource = remoteDataSource
    }
}

extension MovieRepository {
    
    func fetchTrendingMovies(page: String) async throws -> MovieListResponse {
        try await remoteDataSource.fetchTrendingMovies(page: page)
    }
    
    func fetchMovieDetails(movieId: String) async throws -> MovieResponse {
        try await remoteDataSource.fetchMovieDetails(movieId: movieId)
    }
}
