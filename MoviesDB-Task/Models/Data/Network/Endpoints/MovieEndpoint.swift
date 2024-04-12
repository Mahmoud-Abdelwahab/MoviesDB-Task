//
//  MovieEndpoint.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation


enum MovieEndpoint {
    case fetchTrendingMovies
    case fetchMovieDetails(movieId: String)
}

extension MovieEndpoint {
    
    var baseURL: String {
        return Constants.BASE_URL
    }
    
    var path: String {
        switch self {
        case .fetchTrendingMovies:
            return "/discover/movie"
        case .fetchMovieDetails(let movieId):
            return "/movie/\(movieId)"
        }
    }
    
    var parameters: [String: String] {
        switch self {
        case .fetchTrendingMovies, .fetchMovieDetails:
            return ["api_key": Constants.API_KEY]
        }
    }
    
    func makeURL() -> URL? {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
        return components?.url
    }
}
