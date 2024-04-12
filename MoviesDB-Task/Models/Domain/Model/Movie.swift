//
//  Movie.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation

struct Movie: Identifiable {
    let id: Int
    let title: String
    let overview: String
    let posterPath: String
    let releaseDate: String
    
    var displayedDate: String? {
        Helper.getYear(from: releaseDate)
    }
    
    var posterImageURL: URL? {
        URL(string: "\(Constants.POSTER_IMAGE + posterPath)")
    }
}
