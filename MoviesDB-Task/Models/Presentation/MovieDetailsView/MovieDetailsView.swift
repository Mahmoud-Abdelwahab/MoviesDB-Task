//
//  MovieDetailsView.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 13/04/2024.
//

import SwiftUI
import Kingfisher

struct MovieDetailsView: View {
    
    @ObservedObject var viewModel: MovieDetailsViewModel
    
    var body: some View {
        if let movie =  viewModel.movie {
            ScrollView {
                VStack(alignment: .leading) {
                    if let imageURL = movie.posterImageURL {
                        KFImage(imageURL)
                            .resizable()
                            .frame(height: 300)
                            .aspectRatio(contentMode: .fill)
                            .frame(maxWidth: .infinity)
                        
                    } else {
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(maxWidth: .infinity, minHeight: 200)
                    }
                    
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Release Year : " + (movie.displayedDate ?? "- - -"))
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(movie.overview)
                            .font(.body)
                            .foregroundColor(.primary)
                    }
                    .padding()
                }
            }.navigationBarTitle(movie.title)
            
        } else {
            progreseView
        }
    }
}

extension MovieDetailsView {
    
    var progreseView: some View {
        ProgressView()
            .frame(width: 100, height: 100, alignment: .center)
            .task {
                await viewModel.fetchMovieDetails()
            }
    }
}

#Preview {
    MovieDetailsView(viewModel: MovieDetailsViewModel(
        movieDetailsUseCase: MovieDetailsUsecase(movieId: "1181548")
    )
    )
}
