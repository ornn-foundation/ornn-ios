//
//  AlbumsUseCase.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Combine
import Foundation

public protocol AlbumsUseCase {
    func execute() -> AnyPublisher<[AlbumModel], Never>
}

public class AlbumsUseCaseImpl: AlbumsUseCase {
    private let albumsRepository: AlbumsRepository

    public init(albumsRepository: AlbumsRepository = AlbumsRepositoryImpl()) {
        self.albumsRepository = albumsRepository
    }

    public func execute() -> AnyPublisher<[AlbumModel], Never> {
        albumsRepository.getAlbums()
            .map { albums -> [AlbumModel] in
                albums.map { item -> AlbumModel in
                    AlbumModel(id: item.id ?? 0, userID: item.userID ?? 0, title: item.title ?? "")
                }
            }
            .replaceError(with: [])
            .eraseToAnyPublisher()
    }
}
