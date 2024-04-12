//
//  MovieList.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 11/04/2024.
//

import SwiftUI
struct MovieList: View {
    @ObservedObject var viewModel: MovieListViewModel
    
    var body: some View {
        NavigationView {
            content
            .navigationBarTitle("Trending Movies")
        }
        .task {
            await viewModel.fetchMovies()
        }
    }
}


extension MovieList {
    var content: some View {
        List {
            ForEach(viewModel.movies, id: \.id) { movie in
                NavigationLink(destination: MovieDetailsView(viewModel: MovieDetailsViewModel(movieDetailsUseCase: MovieDetailsUsecase(movieId: "\(movie.id)")))) {
                    MovieCell(movie: movie)
                }
            }
            paginationView
        }
    }
    
    var paginationView: some View {
        ProgressView()
            .frame(height: 50)
            .task {
                await viewModel.fetchMovies()
            }
    }
}

#Preview {
    MovieList(viewModel: MovieListViewModel())
}
