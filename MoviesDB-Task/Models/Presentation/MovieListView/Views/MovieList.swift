//
//  MovieList.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 11/04/2024.
//

import SwiftUI
struct MovieList: View {
    @StateObject var viewModel: MovieListViewModel
    
    var body: some View {
        NavigationView {
            content
            .navigationBarTitle("Trending Movies")
            .alert(viewModel.errorMessage ?? "", isPresented: $viewModel.showAlert) {
                        Button("OK", role: .cancel) {
                            viewModel.showAlert = false
                        }
                    }
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
    
//    @ViewBuilder
//      private var alertView: some View {
//          if let errorMessage = viewModel.errorMessage {
//              Alert(title: Text("Error"), message: Text(errorMessage), dismissButton: .default(Text("OK")))
//
//          }
//      }
}

#Preview {
    MovieList(viewModel: MovieListViewModel())
}
