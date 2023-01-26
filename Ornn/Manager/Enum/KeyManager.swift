//
//  KeyManager.swift
//  Ornn
//
//  Created by Naluebet Manpati on 26/1/2566 BE.
//

import Foundation

public enum KeyManager {
    case image(key: String)
    case config(key: String)
    case model(key: String)

    var id: String {
        var setKey: String
        switch self {
        case let .image(key):
            setKey = "imge_\(key)"
        case let .config(key):
            setKey = "config_\(key)"
        case let .model(key):
            setKey = "model_\(key)"
        }
        return setKey
    }
}
