//
//  AlbumsRepositorySpy.swift
//  OrnnTests
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Combine
import Foundation
@testable import Ornn

class AlbumsRepositorySpy: AlbumsRepository {
    var invokedGetAlbums = false
    var invokedGetAlbumsCount = 0
    var stubbedGetAlbumsResult: AnyPublisher<AlbumsResponse, ApiError>!

    func getAlbums() -> AnyPublisher<AlbumsResponse, ApiError> {
        invokedGetAlbums = true
        invokedGetAlbumsCount += 1
        return stubbedGetAlbumsResult
    }
}
