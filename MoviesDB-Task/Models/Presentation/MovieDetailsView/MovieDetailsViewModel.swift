//
//  MovieDetailsViewModel.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 13/04/2024.
//

import Foundation

class MovieDetailsViewModel: ObservableObject {
    @Published var movie: Movie?
    
    private let movieDetailsUseCase: MovieDetailsUsecase
    
    init(movieDetailsUseCase: MovieDetailsUsecase) {
        self.movieDetailsUseCase = movieDetailsUseCase
    }
    
    @MainActor
    func fetchMovieDetails() async{
        do {
            movie =  try await  movieDetailsUseCase.excute()
        } catch {
            print("Error:", error.localizedDescription)
        }
    }
}
