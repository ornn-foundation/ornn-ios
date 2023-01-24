//
//  AlbumsRepositoryTests.swift
//  OrnnTests
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Combine
import Moya
@testable import Ornn
import XCTest

final class AlbumsRepositoryTests: XCTestCase {
    var sut: AlbumsRepository!
    var albumsApi: MoyaProvider<AlbumsApi>!
    var cancellable = Set<AnyCancellable>()

    func test_GetAlbumsLists_GetAlbums_ShouldReturnAlbumsLists() {
        // Given
        var response: AlbumsResponse!
        let expectation = expectation(description: #function)
        albumsApi = MoyaProvider<AlbumsApi>(stubClosure: MoyaProvider.immediatelyStub)
        sut = AlbumsRepositoryImpl(albumsApi: albumsApi)

        // When
        sut.getAlbums()
            .sink { _ in

                // MARK: do nothing.
            } receiveValue: { resut in
                response = resut
                expectation.fulfill()
            }
            .store(in: &cancellable)

        wait(for: [expectation], timeout: 0.1)

        // Then
        XCTAssertNotNil(response)
    }

    func test_NetworkResponse_GetAlbums_ShouldFailureUnauthorized() {
        // Given
        var response: ApiError!
        let expectation = expectation(description: #function)
        albumsApi = MoyaProvider<AlbumsApi>(endpointClosure: customEndpointClosure(statusCode: 401), stubClosure: MoyaProvider.immediatelyStub)
        sut = AlbumsRepositoryImpl(albumsApi: albumsApi)

        // When
        sut.getAlbums()
            .sink { complete in
                if case let .failure(error) = complete {
                    response = error
                    expectation.fulfill()
                }
            } receiveValue: { _ in

                // MARK: do nothing.
            }
            .store(in: &cancellable)

        wait(for: [expectation], timeout: 0.1)

        // Then
        XCTAssertEqual(response, .unauthorized)
    }

    func test_NetworkResponse_GetAlbums_ShouldFailureNotFound() {
        // Given
        var response: ApiError!
        let expectation = expectation(description: #function)
        albumsApi = MoyaProvider<AlbumsApi>(endpointClosure: customEndpointClosure(statusCode: 404), stubClosure: MoyaProvider.immediatelyStub)
        sut = AlbumsRepositoryImpl(albumsApi: albumsApi)

        // When
        sut.getAlbums()
            .sink { complete in
                if case let .failure(error) = complete {
                    response = error
                    expectation.fulfill()
                }
            } receiveValue: { _ in

                // MARK: do nothing.
            }
            .store(in: &cancellable)

        wait(for: [expectation], timeout: 0.1)

        // Then
        XCTAssertEqual(response, .notFound)
    }
}

extension AlbumsRepositoryTests {
    func customEndpointClosure(statusCode: Int) -> (AlbumsApi) -> Endpoint {
        let endpoint = { (target: AlbumsApi) -> Endpoint in
            Endpoint(
                url: URL(target: target).absoluteString,
                sampleResponseClosure: { .networkResponse(statusCode, Data()) },
                method: target.method,
                task: target.task,
                httpHeaderFields: target.headers
            )
        }
        return endpoint
    }
}
