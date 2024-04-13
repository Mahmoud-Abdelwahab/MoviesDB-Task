//
//  MovieListViewModelTests.swift
//  MoviesDB-TaskTests
//
//  Created by Mahmoud Abdelwahab on 13/04/2024.
//

import XCTest
@testable import MoviesDB_Task

///  i am following AAA Approche
///  
final class MovieListViewModelTests: XCTestCase {
    var viewModel: MovieListViewModel!

      override func setUp() {
          super.setUp()
          viewModel = MovieListViewModel()
      }

      override func tearDown() {
          viewModel = nil
          super.tearDown()
      }

    func testFetchMoviesSuccess() async {
        // Arrange
          let movieUseCaseStub = MockMovieUseCase(result: [Movie.movieStubs])
          viewModel = MovieListViewModel(movieUseCase: movieUseCaseStub)

        // Act
          await viewModel.fetchMovies()

         // Assert
          XCTAssertFalse(viewModel.movies.isEmpty)
      }

    func testFetchMoviesFailure() async {
         // Arrange
          let movieUseCaseStub = MockMovieUseCase(error: MovieUseCaseError.someError)
          viewModel = MovieListViewModel(movieUseCase: movieUseCaseStub)
         // Act
          await viewModel.fetchMovies()
         // Assert
          XCTAssertTrue(viewModel.showAlert)

          XCTAssertNotNil(viewModel.errorMessage)
      }
}
