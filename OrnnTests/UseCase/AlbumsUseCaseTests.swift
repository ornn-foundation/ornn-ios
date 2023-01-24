//
//  AlbumsUseCaseTests.swift
//  OrnnTests
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Combine
@testable import Ornn
import XCTest

final class AlbumsUseCaseTests: XCTestCase {
    var sut: AlbumsUseCase!
    var albumsRepositorySpy: AlbumsRepositorySpy!
    var cancellable = Set<AnyCancellable>()

    override func setUp() {
        super.setUp()
        let data = DataManager.forResource(file: "Albums", type: AlbumsResponse.self)!
        albumsRepositorySpy = AlbumsRepositorySpy()
        albumsRepositorySpy.stubbedGetAlbumsResult = Just(data)
            .setFailureType(to: ApiError.self)
            .eraseToAnyPublisher()

        sut = AlbumsUseCaseImpl(albumsRepository: albumsRepositorySpy)
    }

    func test_GetAlbums_Execute_ShouldReturnAlbums() {
        // Given
        var response: [AlbumModel]!
        let expectation = expectation(description: #function)

        // When
        sut.execute()
            .sink { result in
                response = result
                expectation.fulfill()
            }
            .store(in: &cancellable)

        wait(for: [expectation], timeout: 0.1)

        // Then
        XCTAssertEqual(response.count, 2)
    }

    func test_GetAlbumsFailureUnauthorized_Execute_ShouldReturnAlbumsEmpty() {
        // Given
        var response: [AlbumModel]!
        let expectation = expectation(description: #function)
        albumsRepositorySpy.stubbedGetAlbumsResult = Fail(error: .unauthorized)
            .eraseToAnyPublisher()

        // When
        sut.execute()
            .sink { result in
                response = result
                expectation.fulfill()
            }
            .store(in: &cancellable)

        wait(for: [expectation], timeout: 0.1)

        // Then
        XCTAssertTrue(response.isEmpty)
    }

    func test_GetAlbumsFailureNotFound_Execute_ShouldReturnAlbumsEmpty() {
        // Given
        var response: [AlbumModel]!
        let expectation = expectation(description: #function)
        albumsRepositorySpy.stubbedGetAlbumsResult = Fail(error: .notFound)
            .eraseToAnyPublisher()

        // When
        sut.execute()
            .sink { result in
                response = result
                expectation.fulfill()
            }
            .store(in: &cancellable)

        wait(for: [expectation], timeout: 0.1)

        // Then
        XCTAssertTrue(response.isEmpty)
    }
}
