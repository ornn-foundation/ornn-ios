//
//  HomeViewModel.swift
//  Ornn
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Combine
import Foundation

public class HomeViewModel: ObservableObject {
    @Published public var albums = [AlbumModel]()

    private var cancellable = Set<AnyCancellable>()

    private let albumsUseCase: AlbumsUseCase

    public init(albumsUseCase: AlbumsUseCase = AlbumsUseCaseImpl()) {
        self.albumsUseCase = albumsUseCase
    }

    public func getAlbums() {
        albumsUseCase.execute()
            .sink { [weak self] result in
                guard let self = self else { return }
                self.albums = result
            }
            .store(in: &cancellable)
    }
}
