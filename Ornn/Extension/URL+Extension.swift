//
//  URL+Extension.swift
//  Ornn
//
//  Created by Naluebet Manpati on 23/1/2566 BE.
//

import Foundation

public extension URL {
    static func unwrap(url: String) -> URL {
        guard let setBaseURL = URL(string: url) else {
            fatalError("Invalid URL")
        }
        return setBaseURL
    }
}
