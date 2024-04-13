//
//  MovieDetailsUsecase.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

protocol MovieDetailsUsecaseType {
    func excute() async throws -> Movie
}

class MovieDetailsUsecase: MovieDetailsUsecaseType {
    private let repository: MovieRepositoryType
    private let movieId: String
    init(
        repository: MovieRepositoryType = MovieRepository(),
        movieId: String
    ){
        self.repository = repository
        self.movieId = movieId
    }
    
    func excute() async throws -> Movie {
     let model =  try await repository
             .fetchMovieDetails(movieId: movieId)
        return  Movie(id: model.id,
                      title: model.title,
                      overview: model.overview,
                      posterPath: model.posterPath,
                      releaseDate: model.releaseDate)
    }
}
