//
//  RemoteDataSource.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

protocol RemoteDataSourceType {
    func fetchTrendingMovies() async throws -> MovieListResponse
    func fetchMovieDetails(movieId: String) async throws -> MovieResponse
}


class RemoteDataSource: RemoteDataSourceType {
    
    private let networkClient: NetworkClientType
    
    init(
        networkClient: NetworkClientType = NetworkClient()
    ){
        self.networkClient = networkClient
    }
}

extension RemoteDataSource {
  
    func fetchTrendingMovies() async throws -> MovieListResponse {
        try await networkClient.request(.fetchTrendingMovies)
    }
    
    func fetchMovieDetails(movieId: String) async throws -> MovieResponse {
        try await networkClient.request(.fetchMovieDetails(movieId: movieId))
    }
}
