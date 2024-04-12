//
//  MovieCell.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 13/04/2024.
//

import SwiftUI
import Kingfisher

struct MovieCell: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            if let imageURL = movie.posterImageURL {
                KFImage(imageURL)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 100, height: 150)
                    .cornerRadius(10)
            } else {
                Rectangle()
                    .foregroundColor(.gray)
                    .frame(width: 100, height: 150)
                    .cornerRadius(10)
            }
            
            VStack(alignment: .leading) {
                Text(movie.title)
                    .font(.headline)
                    .fontWeight(.bold)
                Text(movie.displayedDate ?? "---")
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding(.leading, 10)
        }
    }
}

#Preview {
    MovieCell(movie: Movie.movieStubs)
}
