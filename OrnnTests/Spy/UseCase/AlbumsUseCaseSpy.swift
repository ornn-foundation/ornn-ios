//
//  AlbumsUseCaseSpy.swift
//  OrnnTests
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Combine
import Foundation
@testable import Ornn

class AlbumsUseCaseSpy: AlbumsUseCase {
    var invokedExecute = false
    var invokedExecuteCount = 0
    var stubbedExecuteResult: AnyPublisher<[AlbumModel], Never>!

    func execute() -> AnyPublisher<[AlbumModel], Never> {
        invokedExecute = true
        invokedExecuteCount += 1
        return stubbedExecuteResult
    }
}
