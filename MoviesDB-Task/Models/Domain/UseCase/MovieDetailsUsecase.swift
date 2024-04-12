//
//  MovieDetailsUsecase.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

class MovieDetailsUsecase {
    private let repository: MovieRepositoryType
    
    init(
        repository: MovieRepositoryType = MovieRepository()
    ){
        self.repository = repository
    }
    
    func excute(movieId: String) async throws -> Movie {
     let model =  try await repository
             .fetchMovieDetails(movieId: movieId)
        return  Movie(id: model.id,
                      title: model.title,
                      overview: model.overview,
                      posterPath: model.posterPath,
                      releaseDate: model.releaseDate)
    }
}
