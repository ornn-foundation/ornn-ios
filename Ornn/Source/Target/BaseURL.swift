//
//  BaseURL.swift
//  Ornn
//
//  Created by Naluebet Manpati on 23/1/2566 BE.
//

import Foundation

enum BaseURL {
    case albums
}

extension BaseURL {
    var url: String {
        var setUrl: String
        switch self {
        case .albums:
            setUrl = "https://jsonplaceholder.typicode.com"
        }
        return setUrl
    }

    var path: String {
        var setPath: String
        switch self {
        case .albums:
            setPath = "/albums"
        }
        return setPath
    }
}
