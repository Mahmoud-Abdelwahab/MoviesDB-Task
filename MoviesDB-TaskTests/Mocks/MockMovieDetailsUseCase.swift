//
//  MockMovieDetailsUseCase.swift
//  MoviesDB-TaskTests
//
//  Created by Mahmoud Abdelwahab on 13/04/2024.
//

import Foundation
@testable import MoviesDB_Task


class MockMovieDetailsUseCase: MovieDetailsUsecaseType {
    var stubbedMovie: Movie?
    var stubbedError: Error?

    func excute() async throws -> Movie {
        if let error = stubbedError {
            throw error
        }
        guard let movie = stubbedMovie else {
            throw MovieDetailsUseCaseError.noMovie
        }
        return movie
    }
}

enum MovieDetailsUseCaseError: Error {
    case someError
    case noMovie
}
