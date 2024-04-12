//
//  TrendingMovieUsecase.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

protocol TrendingMovieUsecaseType {
    func excute() async throws -> [Movie]?
}

class TrendingMovieUsecase: TrendingMovieUsecaseType {
    
    private let repository: MovieRepositoryType
    private var hasMorePage = true
    private var page = 1
    
    init(
        repository: MovieRepositoryType = MovieRepository()
    ){
        self.repository = repository
    }
    
    func excute() async throws -> [Movie]? {
        if hasMorePage {
            let movieResponse = try await repository
                .fetchTrendingMovies(page: "\(self.page)")
            hasMorePage = hasMorePage(totalPages: movieResponse.totalPages)
         return movieResponse.results
                .map {
                    Movie(id: $0.id,
                          title: $0.title,
                          overview: $0.overview,
                          posterPath: $0.posterPath,
                          releaseDate: $0.releaseDate)
                }
        }
        return nil
    }
    
    private func hasMorePage(totalPages: Int) -> Bool {
        if page < totalPages {
            page+=1
            return true
        }
        return false
    }
}
