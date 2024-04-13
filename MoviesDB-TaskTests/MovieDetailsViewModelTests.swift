//
//  MovieDetailsViewModelTests.swift
//  MoviesDB-TaskTests
//
//  Created by Mahmoud Abdelwahab on 13/04/2024.
//

import XCTest
@testable import MoviesDB_Task

///  i am following AAA Approche
///

class MovieDetailsViewModelTests: XCTestCase {
    var viewModel: MovieDetailsViewModel!
    var mockUseCase: MockMovieDetailsUseCase!

    override func setUp() {
        super.setUp()
        mockUseCase = MockMovieDetailsUseCase()
        viewModel = MovieDetailsViewModel(movieDetailsUseCase: mockUseCase)
    }

    override func tearDown() {
        mockUseCase = nil
        viewModel = nil
        super.tearDown()
    }

    func testFetchMovieDetailsSuccess() async throws {
        // Arrange: Setup mock use case to return a movie
        let expectedMovie = Movie.movieStubs
        mockUseCase.stubbedMovie = expectedMovie

        // Act: Perform the fetchMovieDetails method
        await viewModel.fetchMovieDetails()

        // Assert: Check if the movie property is set correctly
        XCTAssertEqual(viewModel.movie?.id, expectedMovie.id)
    }

    func testFetchMovieDetailsFailure() async throws {
        // Arrange: Setup mock use case to throw an error
        mockUseCase.stubbedError = MovieDetailsUseCaseError.someError

        // Act: Perform the fetchMovieDetails method
        await viewModel.fetchMovieDetails()

        // Assert: Check if the movie property is nil
        XCTAssertNil(viewModel.movie)

    }
}
