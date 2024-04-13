//
//  MockMovieUseCase.swift
//  MoviesDB-TaskTests
//
//  Created by Mahmoud Abdelwahab on 13/04/2024.
//

import Foundation
@testable import MoviesDB_Task

class MockMovieUseCase: TrendingMovieUsecaseType {
  
    
    let result: [Movie]?
    let error: Error?

    init(result: [Movie]? = nil, error: Error? = nil) {
        self.result = result
        self.error = error
    }

    func excute() async throws -> [MoviesDB_Task.Movie]? {
        if let error = error {
            throw error
        }
        return result
    }
}
enum MovieUseCaseError: Error {
    case someError
}
