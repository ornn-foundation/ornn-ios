//
//  AlbumsResponse.swift
//  Ornn
//
//  Created by Naluebet Manpati on 23/1/2566 BE.
//

import Foundation

// MARK: - AlbumsModelElement

public struct AlbumsModelElement: Codable {
    let userID: Int?
    let id: Int?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id
        case title
    }
}

public typealias AlbumsResponse = [AlbumsModelElement]
