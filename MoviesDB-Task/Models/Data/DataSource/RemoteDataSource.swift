//
//  RemoteDataSource.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

protocol RemoteDataSourceType {
    func fetchTrendingMovies(page: String) async throws -> MovieListResponse
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
  
    func fetchTrendingMovies(page: String) async throws -> MovieListResponse {
        try await networkClient.request(.fetchTrendingMovies(page: page))
    }
    
    func fetchMovieDetails(movieId: String) async throws -> MovieResponse {
        try await networkClient.request(.fetchMovieDetails(movieId: movieId))
    }
}
