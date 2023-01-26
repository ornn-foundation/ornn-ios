//
//  AlbumsApi.swift
//  Ornn
//
//  Created by Naluebet Manpati on 23/1/2566 BE.
//

import Foundation
import Moya

public enum AlbumsApi {
    case getAlbums
}

extension AlbumsApi: TargetType {
    public var baseURL: URL {
        var setBaseURL: URL
        switch self {
        case .getAlbums:
            setBaseURL = URL.from(string: BaseURL.albums.url)
        }
        return setBaseURL
    }

    public var path: String {
        var setPath: String
        switch self {
        case .getAlbums:
            setPath = BaseURL.albums.path
        }
        return setPath
    }

    public var method: Moya.Method {
        var setMethod: Moya.Method
        switch self {
        case .getAlbums:
            setMethod = .get
        }
        return setMethod
    }

    public var task: Moya.Task {
        var setTask: Moya.Task
        switch self {
        case .getAlbums:
            setTask = .requestPlain
        }
        return setTask
    }

    public var headers: [String: String]? {
        var setHeaders: [String: String]
        switch self {
        case .getAlbums:
            setHeaders = [:]
        }
        return setHeaders
    }

    public var sampleData: Data {
        var data: Data
        switch self {
        case .getAlbums:
            data = BundleResource().forResource(file: "Albums")
        }
        return data
    }
}
