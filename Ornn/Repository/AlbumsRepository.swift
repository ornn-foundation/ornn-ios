//
//  AlbumsRepository.swift
//  Ornn
//
//  Created by Naluebet Manpati on 23/1/2566 BE.
//

import Combine
import CombineMoya
import Foundation
import Moya

public protocol AlbumsRepository {
    func getAlbums() -> AnyPublisher<AlbumsResponse, ApiError>
}

public class AlbumsRepositoryImpl: AlbumsRepository {
    private let albumsApi: MoyaProvider<AlbumsApi>

    public init(albumsApi: MoyaProvider<AlbumsApi> = MoyaProvider<AlbumsApi>()) {
        self.albumsApi = albumsApi
    }

    public func getAlbums() -> AnyPublisher<AlbumsResponse, ApiError> {
        albumsApi.requestPublisher(.getAlbums)
            .filterSuccessfulStatusCodes()
            .map(AlbumsResponse.self)
            .mapError { error -> ApiError in
                guard let response = error.response else { return .unknown }
                return .map(response).status
            }
            .eraseToAnyPublisher()
    }
}
