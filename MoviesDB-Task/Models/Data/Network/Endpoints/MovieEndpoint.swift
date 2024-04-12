//
//  MovieEndpoint.swift
//  MoviesDB-Task
//
//  Created by Mahmoud Abdelwahab on 12/04/2024.
//

import Foundation


enum MovieEndpoint {
    case fetchTrendingMovies(page: String)
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
        var params = ["api_key": Constants.API_KEY]
        switch self {
         case .fetchTrendingMovies(let page):
             params["page"] = String(page)
         default:
             break
         }
         return params
    }
    
    func makeURL() -> URL? {
        var components = URLComponents(string: baseURL + path)
        components?.queryItems = parameters.map { URLQueryItem(name: $0, value: $1) }
        return components?.url
    }
}
