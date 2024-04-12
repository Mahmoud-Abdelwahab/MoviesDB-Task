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

extension Movie {
    static let movieStubs = Movie(id: 1181548,
                                  title: "Heart of the Hunter",
                                  overview: "A retired assassin is pulled back into action when his friend uncovers a dangerous conspiracy at the heart of the South African government.", posterPath: "/n726fdyL1dGwt15bY7Nj3XOXc4Q.jpg",
                                  releaseDate: "2024-03-28")
}
