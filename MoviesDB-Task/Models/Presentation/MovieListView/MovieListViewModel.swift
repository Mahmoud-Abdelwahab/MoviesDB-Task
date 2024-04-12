//
//  MovieListViewModel.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

class MovieListViewModel: ObservableObject {
    @Published var movies: [Movie] = []
    
    private let movieUseCase: TrendingMovieUsecaseType
    
    init(movieUseCase: TrendingMovieUsecaseType = TrendingMovieUsecase()) {
        self.movieUseCase = movieUseCase
    }
    
    @MainActor
    func fetchMovies() async{
            do {
                if let result =  try await  movieUseCase.excute() {
                    movies += result
                }
            } catch {
                print("Error:", error.localizedDescription)
            }
    }
}
