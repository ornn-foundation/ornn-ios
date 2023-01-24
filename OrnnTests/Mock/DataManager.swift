//
//  DataManager.swift
//  OrnnTests
//
//  Created by Naluebet Manpati on 24/1/2566 BE.
//

import Foundation

class DataManager: NSObject {
    static func forResource<Object: Decodable>(file: String, type: Object.Type, ofType: String = "json") -> Object? {
        guard
            let path = Bundle.main.path(forResource: file, ofType: ofType),
            let data = try? Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe),
            let object = try? JSONDecoder().decode(type, from: data)
        else { return nil }
        return object
    }
}
