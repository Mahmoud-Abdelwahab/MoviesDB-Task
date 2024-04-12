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
            List(viewModel.movies) { movie in
                MovieCell(movie: movie)
               // NavigationLink(destination: MovieDetailsView(movie: movie)) {
                //    MovieCell(movie: movie)
              //  }
            }
            .navigationBarTitle("Trending Movies")
        }
        .task {
            await viewModel.fetchMovies()
        }

    }
}

#Preview {
    MovieList(viewModel: MovieListViewModel())
}
